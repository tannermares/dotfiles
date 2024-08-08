#!/bin/bash

# Install brew (package manager) https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Enable brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install libraries
#  1. bat       (cat improvement)                    https://github.com/sharkdp/bat
#  2. btop      (htop on steriods)                   https://github.com/aristocratos/btop
#  3. fastfetch (cute system info)                   https://github.com/fastfetch-cli/fastfetch
#  4. fish      (RAD shell)                          https://fishshell.com/
#  5. fzf       (fuzzy finder used in zoxide)        https://github.com/junegunn/fzf
#  6. lazygit   (fun git TUI)                        https://github.com/jesseduffield/lazygit
#  7. llvm      (needed for ruby installs)           https://www.llvm.org/
#  8. lsd       (list improvement)                   https://github.com/lsd-rs/lsd
#  9. mise      (development environment setup tool) https://mise.jdx.dev/
# 10. mysql     (relational database)                https://dev.mysql.com/doc/
# 11. neovim    (vim alternative)                    https://neovim.io
# 12. redis     (in memory database)                 https://redis.io/docs/latest/
# 13. starship  (shell prompt)                       https://starship.rs/
# 14. tldr      (simplified man pages)               https://tldr.sh/
# 15. wget      (better web getter)                  https://www.gnu.org/software/wget/
# 16. zoxide    (smarter cd command)                 https://github.com/ajeetdsouza/zoxide
brew install bat btop fastfetch fish fzf go lazygit llvm lsd mise mysql neovim starship tldr wget zoxide

# Install cask apps
#  1. alacritty         (terminal emulator)      https://alacritty.org/
#  2. GPG Suite         (manage GPG keys)        https://gpgtools.org/
#  3. Keeping You Awake (prevent system sleep)   https://keepingyouawake.app/
#  4. Medis             (Modern GUI for Redis)   https://getmedis.com/
#  5. QuickLook Plugins (makes quicklook better) https://www.quicklookplugins.com/
#  6. RapidAPI          (api client)             https://rapidapi.com
#  7. Rectangle         (window manager)         https://rectangleapp.com/
#  8. Rocket            (emoji app)              https://matthewpalmer.net/rocket/
#  9. Sequel Ace        (database client)        https://sequel-ace.com/
# 10. VSCode            (text editor)            https://code.visualstudio.com/
brew install --cask alacritty gpg-suite keepingyouawake medis qlcolocode qlimagesize qlmarkdown qlprettypatch qlvideo quicklook-csv quicklook-json quicklookase rapidapi rectangle rocket sequel-ace visual-studio-code webquicklook

# Start services
brew services start mysql
brew services start redis

# Install lazyvim https://www.lazyvim.org/
git clone https://github.com/LazyVim/starter ~/.config/nvim && rm -rf ~/.config/nvim/.git

# Add tokyonight themes
# Alacritty https://github.com/folke/tokyonight.nvim/tree/main/extras/alacritty
mkdir -p ~/.config/alacritty
ln -fs $(pwd)/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -fs $(pwd)/alacritty/themes ~/.config/alacritty/themes

# NeoVim https://github.com/folke/tokyonight.nvim/tree/main
ln -fs $(pwd)/nvim/lua/plugins/colorscheme.lua ~/.config/nvim/lua/plugins/colorscheme.lua

# Lazygit https://github.com/folke/tokyonight.nvim/tree/main/extras/lazygit
mkdir -p ~/.config/lazygit
ln -fs $(pwd)/lazygit/tokyonight_night.yml ~/.config/lazygit/config.yml

# Symlink fish configs
mkdir -p ~/.config/fish/conf.d
ln -fs $(pwd)/fish/config.fish ~/.config/fish/config.fish
ln -fs $(pwd)/fish/conf.d/* ~/.config/fish/conf.d
ln -fs $(pwd)/fish/themes ~/.config/fish

# Symlink .dotfiles
ln -fs $(pwd)/dotfiles/gemrc ~/.gemrc
ln -fs $(pwd)/dotfiles/gitconfig ~/.gitconfig
ln -fs $(pwd)/dotfiles/gitignore ~/.gitignore
ln -fs $(pwd)/dotfiles/rspec ~/.rspec

# Set fish as login shell
echo $(brew --prefix)/bin/fish | sudo tee -a /etc/shells && chsh -s $(brew --prefix)/bin/fish

# Install fisher plugin manager https://github.com/jorgebucaran/fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install sponge plugin (removes typos from fish history) https://github.com/meaningful-ooo/sponge
fisher install meaningful-ooo/sponge

# Enable starship if not already enabled
starship init fish | source

# Set starship theme
starship preset pastel-powerline -o ~/.config/starship.toml

# Install node & ruby
mise use --global node@latest && mise use --global ruby@latest

# Download NerdFont https://www.nerdfonts.com/font-downloads
curl -L -o ~/Downloads/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip

# Things you have to do from GUI
# 1. Import iTerm profile and colors
# 2. Click on font files to import them into fontbook
# 3. Login to vscode for settings syncing
