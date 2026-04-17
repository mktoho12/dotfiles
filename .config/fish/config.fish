set -gx LC_CTYPE en_US.UTF-8

if status is-interactive
  # Commands to run in interactive sessions can go here
  eval (/opt/homebrew/bin/brew shellenv)
  starship init fish | source
end

# status --is-interactive; and source (nodenv init -|psub)
# status --is-interactive; and source (rbenv init -|psub)

alias be="bundle exec"
alias gs="git switch"
alias config='/usr/bin/git --git-dir=/Users/mktoho/.cfg/ --work-tree=/Users/mktoho'
alias docked='docker run --rm -it -v (pwd):/rails -v ruby-bundle-cache:/bundle -p 3000:3000 ghcr.io/rails/cli'

# pnpm
set -gx PNPM_HOME "/Users/mktoho/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
set -Ux fish_user_paths $HOME/Library/Android/sdk/platform-tools $fish_user_paths
# pnpm end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mktoho/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/mktoho/Downloads/google-cloud-sdk/path.fish.inc'; end

# mise
/Users/mktoho/.local/bin/mise activate fish | source
