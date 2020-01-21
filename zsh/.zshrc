fpath+=("$HOME/.local/share/pure")
# Set up the prompt

autoload -Uz promptinit
promptinit

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' special-dirs true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

zstyle :prompt:pure:git:branch color '#8fbcbb'
zstyle :prompt:pure:git:dirty color '#bf616a'
zstyle :prompt:pure:git:arrow color '#88c0d0'
zstyle :prompt:pure:path color '#81a1c1'
zstyle :prompt:pure:execution_time color '#ebcb8b'
zstyle :prompt:pure:prompt:error color '#bf616a'
zstyle :prompt:pure:prompt:success color '#a3be8c'
zstyle :prompt:pure:prompt:continuation color '#b48ead'

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

alias ls='ls --color=auto'
alias ll='ls -l'
alias llh='ls -lh'
alias la='ls -A'
alias git='LANG=C git'

PURE_GIT_PULL=0
PURE_GIT_UNTRACKED_DIRTY=0

prompt pure

DIR="$( cd "$( dirname "$(realpath ${(%):-%N})" )" && pwd )"
. $DIR/../z/z.sh

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
