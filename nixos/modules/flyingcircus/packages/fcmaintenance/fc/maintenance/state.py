import enum


class State(enum.Enum):
    pending = ' '
    due = '='
    running = '*'
    success = 'S'
    tempfail = 'T'
    retrylimit = 'R'
    error = 'E'
    deleted = 'D'
    postpone = 'P'

    def __str__(self):
        return self.name

    def __lt__(self, other):
        """Arbitrary sort order. It sufficient to have a sort order at all."""
        return self.name < other.name

    def short(self):
        return self.value


ARCHIVE = {State.success, State.error, State.retrylimit, State.deleted}

EXIT_SUCCESS = 0
EXIT_POSTPONE = 69
EXIT_TEMPFAIL = 75


def evaluate_state(returncode):
    if returncode == EXIT_SUCCESS:
        return State.success
    if returncode == EXIT_TEMPFAIL:
        return State.tempfail
    if returncode == EXIT_POSTPONE:
        return State.postpone
    return State.error
