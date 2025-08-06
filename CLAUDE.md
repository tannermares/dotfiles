# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for macOS development environment setup, featuring comprehensive configuration for Fish shell, WezTerm, Neovim (LazyVim), and various development tools. The repository follows a symlink-based approach for configuration management.

## Installation and Setup

### Initial Setup
```bash
# Clone and run the installation script
git clone git@github.com:tannermares/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

**Note**: The install script may not work perfectly on first run and likely requires manual intervention. Review the script before execution.

### Key Installation Components
- **Package Manager**: Homebrew with comprehensive tool installation
- **Shell**: Fish shell with custom configurations, abbreviations, and functions
- **Terminal**: WezTerm with Tokyo Night theme
- **Editor**: Neovim with LazyVim configuration
- **Runtime Management**: mise for Node.js and Ruby versions
- **Database Services**: MySQL and Redis (auto-started via brew services)

## Architecture and Configuration Structure

### Core Configuration Files
- `install.sh` - Main installation script for system setup
- `fish/config.fish` - Fish shell main configuration
- `fish/conf.d/` - Modular Fish configuration (abbreviations, functions, variables)
- `wezterm/wezterm.lua` - WezTerm terminal configuration
- `dotfiles/` - Traditional dotfiles (gitconfig, gitignore, etc.)
- `nvim/` - Neovim/LazyVim colorscheme configuration

### Fish Shell Custom Components
- **Abbreviations** (`fish/conf.d/abbr.fish`): Git workflows, Rails development, AWS shortcuts
- **Functions** (`fish/conf.d/functions.fish`): 
  - `rmb` - Remove merged branches automatically
  - `mp4merge` - Concatenate MP4 files using ffmpeg
- **Variables** (`fish/conf.d/variables.fish`): Environment setup for development tools

### Theming System
Consistent Tokyo Night theme across:
- WezTerm terminal colors
- Fish shell themes (day/moon/night/storm variants)
- iTerm2 color schemes
- Lazygit configuration
- Neovim colorscheme

## Common Development Workflows

### Git Operations
```fish
# Quick branch switching and updates
main          # Switch to main, stash changes, fetch and rebase
staging       # Switch to staging, stash changes, fetch and rebase
rmb           # Remove all merged branches
gtfo          # Hard reset and clean working directory
```

### Rails Development
```fish
# Database operations
dm            # Migrate databases (dev + test) and reset structure.sql
drb           # Rollback last migration (dev + test) and reset structure.sql
devlog        # Tail development log
be            # Bundle exec prefix
```

### System Commands
```fish
ll            # Detailed file listing with lsd
ls            # Basic file listing with lsd
p "process"   # Search running processes
clr           # Clear terminal
```

## Development Environment

### Runtime Management
- **Node.js**: Managed via mise (`mise use --global node@latest`)
- **Ruby**: Managed via mise (`mise use --global ruby@latest`)
- **Package Managers**: pnpm (preferred), yarn with Corepack

### Database Setup
- **MySQL**: Auto-started service, mysql2 gem pre-configured with OpenSSL and zstd support
- **Redis**: Auto-started service
- **PostgreSQL**: Available via PostgresApp and pgAdmin4

### Key Development Tools
- **Terminal**: WezTerm with JetBrains Mono Nerd Font
- **Editor**: Neovim with LazyVim, VS Code as backup
- **Git UI**: Lazygit with Tokyo Night theme
- **System Info**: fastfetch, btop for monitoring
- **File Operations**: bat (cat replacement), lsd (ls replacement), fzf (fuzzy finder)

## Configuration Management

All configurations use symbolic links created by the install script:
- Fish configs link to `~/.config/fish/`
- WezTerm config links to `~/.config/wezterm/`
- Dotfiles link to home directory (`~/.gitconfig`, `~/.gemrc`, etc.)
- Neovim plugins link to `~/.config/nvim/lua/plugins/`

When modifying configurations, edit the source files in this repository - changes will be reflected immediately due to symlinks.

## Services and Background Processes

The following services are configured to start automatically:
- MySQL (`brew services start mysql`)
- Redis (`brew services start redis`)
- Starship prompt initialization in Fish shell