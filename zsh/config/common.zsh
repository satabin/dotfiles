setopt histignorealldups sharehistory histignorespace

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

PATH="$PATH:$HOME/.local/bin"
