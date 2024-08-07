if not set --query --global MY_VAR_SET
  set --global MY_VAR_SET true

  set -g fish_greeting
  set -gx EDITOR nvim
  set -gx VISUAL $EDITOR
  set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'" # Enables syntax highlighting in manpages
  set -gx XDG_CONFIG_HOME "$HOME/.config" # Sets config directory for lazygit
end
