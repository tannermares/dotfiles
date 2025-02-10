if not set --query --global MY_SOURCE_SET
  set --global MY_SOURCE_SET true
  fish_add_path /home/linuxbrew/.linuxbrew/bin
  fish_add_path /home/linuxbrew/.linuxbrew/sbin

  fzf --fish | source
  starship init fish | source
  zoxide init fish | source
end
