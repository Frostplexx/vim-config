# Vim Config

Welcome to my vim config. This is a work in progress and will be updated as I find new plugins and features that I like.
It's based on [LazyVim](https://www.lazyvim.org/).

## Installation

### Requirements

- NeoVim
- Git
- JetbrainsMono Nerd Font (or any other NerdFont)
- lazygit
- ripgrep
- fd (find files)
- fortune
- xcode-build-server
- XCode
- xcodegen
- swiftlint
- swiftformat

You can run

```bash
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

to install the font on MacOS and `brew install neovim git lazygit ripgrep fd fortune xcodegen swiftlint swiftformat` to install all of these on MacOS.
For xcode-build-server see: https://github.com/SolaWing/xcode-build-server and XCode can be obtained from the AppStore

### Backup your old config (Optional)

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

### Set up .ideavimrc (Optional)

This config also includes my .ideavimrc file. Symlink it to your home folder with the following command:

```bash
ln -s ~/.config/nvim/.ideavimrc ~/.ideavimrc
```

and install the IdeaVim plugin in your IDE.

For more information on how to install plugins, see [LazyVim install guide](https://www.lazyvim.org/installation).
