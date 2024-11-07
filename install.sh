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
#  3. cmake     (Cross-platform make)                https://www.cmake.org/
#  4. deno      (opensource javascript runtime)      http://deno.com
#  5. fastfetch (cute system info)                   https://github.com/fastfetch-cli/fastfetch
#  6. ffmpeg    (record, convert and stream A/V)     https://ffmpeg.org/
#  7. fish      (RAD shell)                          https://fishshell.com/
#  8. fzf       (fuzzy finder used in zoxide)        https://github.com/junegunn/fzf
#  9. lazygit   (fun git TUI)                        https://github.com/jesseduffield/lazygit
# 10. llvm      (needed for ruby installs)           https://www.llvm.org/
# 11. lsd       (list improvement)                   https://github.com/lsd-rs/lsd
# 12. mise      (development environment setup tool) https://mise.jdx.dev/
# 13. mysql     (relational database)                https://dev.mysql.com/doc/
# 14. neovim    (vim alternative)                    https://neovim.io
# 15. ninja     (Small build system)                 https://ninja-build.org/
# 16. redis     (in memory database)                 https://redis.io/docs/latest/
# 17. starship  (shell prompt)                       https://starship.rs/
# 18. tldr      (simplified man pages)               https://tldr.sh/
# 19. wget      (better web getter)                  https://www.gnu.org/software/wget/
# 10. zoxide    (smarter cd command)                 https://github.com/ajeetdsouza/zoxide
brew install bat btop cmake deno fastfetch ffmpeg fish fzf go lazygit llvm lsd mise mysql neovim ninja starship tldr wget zoxide

# Install cask apps
#  1. Discord           (Voice and text chat)    https://discord.com/
#  2. GPG Suite         (manage GPG keys)        https://gpgtools.org/
#  3. Keeping You Awake (prevent system sleep)   https://keepingyouawake.app/
#  4. Logitech G HUB    (light controller)       https://www.logitechg.com/en-us/innovation/g-hub.html
#  5. Medis             (Modern GUI for Redis)   https://getmedis.com/
#  6. pgAdmin           (PostgresSQL admin)      https://www.pgadmin.org/
#  7. PostgresApp       (Postgres App)           https://postgresapp.com/
#  8. QuickLook Plugins (makes quicklook better) https://www.quicklookplugins.com/
#  9. RapidAPI          (api client)             https://rapidapi.com
# 10. Rectangle         (window manager)         https://rectangleapp.com/
# 11. Rocket            (emoji app)              https://matthewpalmer.net/rocket/
# 12. Sequel Ace        (database client)        https://sequel-ace.com/
# 13. Slack             (chat client)            https://slack.com/
# 14. SQLiteStudio      (sqlite database client) https://sqlitestudio.pl/
# 15. StreamLabs        (streaming software)     https://streamlabs.com/
# 16. VSCode            (text editor)            https://code.visualstudio.com/
# 17. WezTerm           (terminal emulator)      https://wezfurlong.org/wezterm/
brew install --cask discord gpg-suite keepingyouawake logitech-g-hub medis pgadmin4 qlcolocode qlimagesize qlmarkdown qlprettypatch qlvideo quicklook-csv quicklook-json quicklookase rapidapi rectangle rocket sequel-ace slack sqlitestudio streamlabs visual-studio-code webquicklook wezterm

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
