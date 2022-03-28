#!/bin/sh

# brew install tmux neovim

# rm ~/.cdcrc ~/.gitconfig ~/.tmux.conf ~/.zshrc
# rm -rf ~/.config/alacritty
# rm -rf ~/.config/nvim
# rm -rf ~/.doom.d

# ln -s ~/github/joerter/dotfiles/.cdcrc ~/.cdcrc
# ln -s ~/github/joerter/dotfiles/alacritty ~/.config/alacritty
# ln -s ~/github/joerter/dotfiles/.gitconfig ~/.gitconfig
# ln -s ~/github/joerter/dotfiles/nvim ~/.config/nvim
# ln -s ~/github/joerter/dotfiles/.tmux.conf ~/.tmux.conf
# ln -s ~/github/joerter/dotfiles/.zshrc ~/.zshrc

# mkdir ~/.doom.d
# ln -s ~/github/joerter/dotfiles/.doom.d/config.el ~/.doom.d/config.el
# ln -s ~/github/joerter/dotfiles/.doom.d/init.el ~/.doom.d/init.el
# ln -s ~/github/joerter/dotfiles/.doom.d/packages.el ~/.doom.d/packages.el

# oh-my-zsh
#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# nvm
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash


# cdc
# git clone https://github.com/evanthegrayt/cdc.git $ZSH_CUSTOM/plugins/cdc

# zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions

# tpm
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# nvm-lspconfig
npm i -g typescript typescript-language-server
