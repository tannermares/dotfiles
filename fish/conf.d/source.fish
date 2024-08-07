if not set --query --global MY_SOURCE_SET
  set --global MY_SOURCE_SET true

  fzf --fish | source
  starship init fish | source
  zoxide init fish | source
end
