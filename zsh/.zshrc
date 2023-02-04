# local specific things, might not exist
source "$HOME/.config/zsh/local.zsh" 2> /dev/null

# Load GPG agent and emulated SSH agent
export GPG_TTY="${TTY}"
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
gpgconf --launch gpg-agent

source "$HOME/.config/zsh/completion.zsh"
source "$HOME/.config/zsh/common.zsh"
source "$HOME/.config/zsh/aliases.zsh"

# Load ZSH plugins
eval "$(sheldon source)"

# Load Starship prompt
eval "$(starship init zsh)"

# Load Zoxide (ie, `z`)
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
