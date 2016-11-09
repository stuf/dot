#!/usr/bin/env zsh

HEADING=$(tput smul)
RESET=$(tput sgr0)

put_heading() { echo "${HEADING}${@}${RESET}"; }

indent() { sed 's/^/    /'; }

# Thanks! https://github.com/creationix/nvm/issues/539#issuecomment-110643090
lazy_source () {
    eval "$1 () { [ -f $2 ] && source $2 && $1 \$@ }"
}
