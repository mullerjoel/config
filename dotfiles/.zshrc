# Check if command is available
has() {
  command -v "$1" >/dev/null 2>&1
}

# Check if system is macOS
is_mac() {
  [ "$(uname -s)" = "Darwin" ]
}

# Check if system is Linux
is_linux() {
  [ "$(uname -s)" = "Linux" ]
}

# sheldon plugin manager
export ZSH="$HOME/.local/share/sheldon/repos/github.com/ohmyzsh/ohmyzsh"
eval "$(sheldon source)"

# Local user binaries
export PATH="$HOME/.local/bin:$PATH"

# Personal scripts
export PATH="$HOME/config/bin:$PATH"
export PATH="$HOME/notes/bin:$PATH"

# Homebrew path (Apple Silicon)
export PATH="/opt/homebrew/bin:$PATH"

# jenv for managing Java versions
export PATH="$HOME/.jenv/bin:$PATH"
has jenv && eval "$(jenv init -)"

# fzf key bindings and completion
has fzf && source <(fzf --zsh)

# fnm for Node.js versions
has fnm && eval "$(fnm env --use-on-cd --shell zsh)"

# pyenv for Python versions and virtualenvs
export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
has pyenv && eval "$(pyenv init - zsh)"
has pyenv && eval "$(pyenv virtualenv-init -)"

# Shell aliases
is_linux && has xsel && alias copy='xsel --input --clipboard'
is_linux && has xsel && alias paste='xsel --output --clipboard'
is_mac && has pbcopy && alias copy='pbcopy'
is_mac && has pbpaste && alias paste='pbpaste'
alias l='ls -lha'
