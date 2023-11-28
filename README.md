# Vim Config

Welcome to my vim config. This is a work in progress and will be updated as I find new plugins and features that I like.
It's based on [LazyVim](https://www.lazyvim.org/).

## Installation

### Requirements

- NeoVim
- Git
- JetbrainsMono Nerd Font
- lazygit
- ripgrep
- fd (find files)
- fortune

You can run

```bash
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

to install the font on MacOS and `brew install neovim git lazygit ripgrep fd fortune` to install all of these on MacOS.

### Backup your old config

```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

### Clone the repo

```bash
git clone https://github.com/Frostplexx/vim-config.git ~/.config/nvim
```

For more information on how to install plugins, see [LazyVim install guide](https://www.lazyvim.org/installation).
