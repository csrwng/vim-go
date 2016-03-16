#!/bin/bash
export PS1="\[\033[34m\]\u\[\033[m\] \[\033[37;2m\]\w\[\033[m\] \$ "
export CLICOLOR=1
export PATH=${PATH}:${HOME}/bin
set -o vi

export GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh
