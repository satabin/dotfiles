fpath+=("$HOME/.local/share/pure")
autoload -U promptinit; promptinit

autoload -U compinit && compinit

alias ll='ls -l'
alias llh='ls -lh'
alias la='ls -A'
alias git='LANG=C git'

DIR="$( cd "$( dirname "$(realpath ${(%):-%N})" )" && pwd )"
. $DIR/../z/z.sh

PURE_GIT_PULL=0
PURE_GIT_UNTRACKED_DIRTY=0

prompt pure
