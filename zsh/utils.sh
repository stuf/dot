#!/usr/bin/env zsh

HEADING=$(tput smul)
RESET=$(tput sgr0)

put_heading() { echo "${HEADING}${@}${RESET}"; }

indent() { sed 's/^/    /'; }
