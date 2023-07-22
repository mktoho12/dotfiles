if status is-interactive
  # Commands to run in interactive sessions can go here
  eval (brew shellenv)
  starship init fish | source
end

# status --is-interactive; and source (nodenv init -|psub)
# status --is-interactive; and source (rbenv init -|psub)

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

alias be="bundle exec"
alias gs="git switch"
alias config='/usr/bin/git --git-dir=/Users/mktoho/.cfg/ --work-tree=/Users/mktoho'

if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
  source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

if test -f /usr/local/opt/asdf/libexec/asdf.fish
  source /usr/local/opt/asdf/libexec/asdf.fish
end

# pnpm
set -gx PNPM_HOME "/Users/mktoho/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mktoho/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/mktoho/Downloads/google-cloud-sdk/path.fish.inc'; end
