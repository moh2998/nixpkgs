#[macro_use]
extern crate clap;

use clap::Arg;
use failure::{format_err, Error, Fallible, ResultExt};
use serde_derive::Deserialize;
use serde_json::Value;
use std::collections::HashMap;
use std::fmt;
use std::fs::{read_dir, File};
use std::io::BufReader;
use std::path::{Path, PathBuf};
use std::process;

#[derive(Debug, Clone, Deserialize)]
struct ClientDef {
    checks: HashMap<String, Value>,
}

#[derive(Debug)]
enum Status {
    Good(usize),  // `Ok` is already used by `Result`
    Warning(&'static str),
    Error(Error),
}

impl fmt::Display for Status {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            Status::Good(i) => write!(f, "{} check definition(s)", i),
            Status::Warning(msg) => write!(f, "{}", msg),
            Status::Error(e) => {
                let causes: Vec<_> = e.iter_chain().map(|c| c.to_string()).collect();
                write!(f, "{}", causes.join(": "))
            }
        }
    }
}

impl Status {
    fn code(&self) -> i32 {
        match self {
            Status::Good(_) => 0,
            Status::Warning(_) => 1,
            Status::Error(_) => 2,
        }
    }

    fn marker(&self) -> &'static str {
        match self {
            Status::Good(_) => "=ok=",
            Status::Warning(_) => "warn",
            Status::Error(_) => "crit",
        }
    }
}

fn decode(json: &Path) -> Fallible<ClientDef> {
    Ok(serde_json::from_reader(BufReader::new(File::open(json)?))?)
}

fn check(sensu_client_check: &Path) -> Status {
    let def = match decode(sensu_client_check) {
        Ok(def) => def,
        Err(e) => return Status::Error(e.into()),
    };
    if def.checks.is_empty() {
        Status::Warning("does not contain any check definition")
    } else {
        Status::Good(def.checks.len())
    }
}

type CheckResults = Vec<(PathBuf, Status)>;

fn run<P: AsRef<Path>>(sensu_config_dir: P) -> Fallible<CheckResults> {
    let d = sensu_config_dir.as_ref();
    Ok(read_dir(d)
        .context(format_err!("Cannot open `{}'", d.display()))?
        .filter_map(|e| e.ok().map(|e| e.path()))
        .filter(|p| !p.is_dir() && p.extension().unwrap_or_default() == "json")
        .map(|p| {
            let stat = check(&p);
            (p, stat)
        })
        .collect())
}

fn output(mut res: CheckResults) -> i32 {
    res.sort_by_key(|(_, s)| -s.code());
    let max = res.iter().map(|e| e.1.code()).max().unwrap_or_default();
    let ncrit = res.iter().filter(|e| e.1.code() >= 2).count();
    let nwarn = res.iter().filter(|e| e.1.code() == 1).count();
    match max {
        0 => println!("OK: {} Sensu check config(s) found", res.len()),
        1 => println!("WARNING: {} warning(s)", nwarn),
        _ => println!("CRITICAL: {} error(s), {} warning(s)", ncrit, nwarn),
    }
    res.iter().for_each(|(f, s)| println!("[{}] {}: {}", s.marker(), f.display(), s));
    max
}

fn main() {
    let m = app_from_crate!()
        .arg(
            Arg::from_usage("[DIR] -d --directory 'Searches for local sensu checks in DIR'")
                .default_value("/etc/local/sensu-client"),
        )
        .get_matches();
    match run(m.value_of_os("DIR").unwrap()) {
        Err(e) => {
            print!("UNKOWN: {}", e);
            for cause in e.iter_causes() {
                print!(": {}", cause)
            }
            println!();
            process::exit(3)
        }
        Ok(results) => process::exit(output(results)),
    }
}
