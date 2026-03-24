if not set --query --global MY_VAR_SET
  set --global MY_VAR_SET true

  set -g fish_greeting
  set -gx EDITOR nvim
  set -gx VISUAL $EDITOR
  set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'" # Enables syntax highlighting in manpages
  set -gx XDG_CONFIG_HOME "$HOME/.config" # Sets config directory for lazygit
  set -gx ANDROID_HOME $HOME/Library/Android/sdk
  fish_add_path $ANDROID_HOME/platform-tools $ANDROID_HOME/emulator
end
