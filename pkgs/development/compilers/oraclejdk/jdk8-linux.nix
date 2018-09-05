import ./jdk-linux-base.nix {
  productVersion = "8";
  patchVersion = "181";
  downloadUrl = http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html;
  sha256_i686 = "5e2d3c0808480de058ad7b114113d029a76fa406f9402ae4d82555247473d3bb   ";
  sha256_x86_64 = "1845567095bfbfebd42ed0d09397939796d05456290fb20a83c476ba09f991d3";
  jceName = "jce_policy-8.zip";
  jceDownloadUrl = http://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html;
  sha256JCE = "0n8b6b8qmwb14lllk2lk1q1ahd3za9fnjigz5xn65mpg48whl0pk";
}
