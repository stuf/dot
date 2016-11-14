#!/usr/bin/env zsh

HEADING=$(tput smul)
RESET=$(tput sgr0)
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)

put_heading() { echo "${HEADING}${@}${RESET}"; }

indent() { sed 's/^/    /'; }

# Thanks! https://github.com/creationix/nvm/issues/539#issuecomment-110643090
lazy_source () {
    eval "$1 () { [ -f $2 ] && source $2 && $1 \$@ }"
}

### Status utils
# Invoke at start
printstatus_start() {
  local pad=20
  printf "%-.${pad}s ... " "$1"
}

# Invoke at finish
printstatus_end() {
  if [[ $1 = "done" ]]; then
    printf "[ ${GREEN}Done${RESET} ]"
  fi
}

