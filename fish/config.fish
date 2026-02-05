if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Maybe don't need this?
eval (/opt/homebrew/bin/brew shellenv)

# pnpm
set -gx PNPM_HOME "/Users/tanner/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

export PATH="$HOME/.local/bin:$PATH"
