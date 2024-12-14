#!/bin/bash

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -rf ~/.zshrc
rm -rf ~/.alias

cp .alias ~/.alias
cp .zshrc ~/.zshrc
cp ascii_art.txt ~

mkdir -p ~/.zsh
cp -v catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/

cd ~/.oh-my-zsh/plugins

git clone https://github.com/zsh-users/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search
git clone https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/paulirish/git-open.git

# cd ~/.zsh
# git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
# cd zsh-syntax-highlighting/themes/

pip3 install thefuck
sudo apt install autojump
