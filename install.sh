#!/bin/bash

##
# Install Libraries, Services, and Applications
##

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
#  1. GPG Suite         (manage GPG keys)        https://gpgtools.org/
#  2. Keeping You Awake (prevent system sleep)   https://keepingyouawake.app/
#  3. Logitech G HUB    (light controller)       https://www.logitechg.com/en-us/innovation/g-hub.html
#  4. Medis             (Modern GUI for Redis)   https://getmedis.com/
#  5. pgAdmin           (PostgresSQL admin)      https://www.pgadmin.org/ 
#  6. PostgresApp       (Postgres App)           https://postgresapp.com/
#  7. QuickLook Plugins (makes quicklook better) https://www.quicklookplugins.com/
#  8. RapidAPI          (api client)             https://rapidapi.com
#  9. Rectangle         (window manager)         https://rectangleapp.com/
# 10. Rocket            (emoji app)              https://matthewpalmer.net/rocket/
# 11. Sequel Ace        (database client)        https://sequel-ace.com/
# 12. Slack             (chat client)            https://slack.com/
# 13. SQLiteStudio      (sqlite database client) https://sqlitestudio.pl/
# 14. StreamLabs        (streaming software)     https://streamlabs.com/
# 15. VSCode            (text editor)            https://code.visualstudio.com/
# 16. WezTerm           (terminal emulator)      https://wezfurlong.org/wezterm/
brew install --cask gpg-suite keepingyouawake logitech-g-hub medis pgadmin4 qlcolocode qlimagesize qlmarkdown qlprettypatch qlvideo quicklook-csv quicklook-json quicklookase rapidapi rectangle rocket sequel-ace slack sqlitestudio streamlabs visual-studio-code webquicklook wezterm

# Start services
brew services start mysql
brew services start redis

# Install lazyvim https://www.lazyvim.org/
git clone https://github.com/LazyVim/starter ~/.config/nvim && rm -rf ~/.config/nvim/.git

##
# Configuration
##

# Add tokyonight themes
# WezTerm https://github.com/folke/tokyonight.nvim/tree/main/extras/wezterm
mkdir -p ~/.config/wezterm
ln -fs $(pwd)/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua

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

##
# NerdFont Integration
##

# Download NerdFont https://www.nerdfonts.com/font-downloads
curl -L -o ~/Downloads/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip

# Unzip into Downloads
unzip ~/Downloads/JetBrainsMono.zip -d ~/Downloads/JetBrainsMono

# Open Fontbook and drag all downloaded fonts there
open -b com.apple.Fontbook


##
# App (Web and Mobile) prep
##

# Install node & ruby
mise use --global node@latest && mise use --global ruby@latest

# Insall mysql2 gem https://stackoverflow.com/questions/67840691/ld-library-not-found-for-lzstd-while-bundle-install-for-mysql2-gem-ruby-on-mac
gem install mysql2 -- --with-opt-dir=$(brew --prefix openssl) --with-ldflags=-L/opt/homebrew/opt/zstd/lib

# Insall yarn 2 in yarn 1 app https://yarnpkg.com/migration/guide#migration-steps
corepack enable
yarn set version stable
yarn install

##
# VS Code
##

# Login to vscode for settings syncing...done!

##
# Xcode
##

xcode-select --install
sudo xcode-select -s /Applications/Xcode.app

# 1. Login to AppleId & Github in Settings -> accounts
