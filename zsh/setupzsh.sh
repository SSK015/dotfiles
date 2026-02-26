#!/bin/bash

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -rf ~/.zshrc
rm -rf ~/.alias

cp .alias ~/.alias
cp .zshrc ~/.zshrc
cp ascii_art.txt ~

mkdir -p ~/.zsh
cp -v catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/
cp -v catppuccin_latte-zsh-syntax-highlighting.zsh ~/.zsh/

cd ~/.oh-my-zsh/plugins

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-completions ]; then
git clone https://github.com/zsh-users/zsh-completions
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search ]; then
git clone https://github.com/zsh-users/zsh-history-substring-search
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/web-search ]; then
git clone https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-you-should-use ]; then
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
git clone https://github.com/zsh-users/zsh-autosuggestions.git
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/git-open ]; then
git clone https://github.com/paulirish/git-open.git
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-fzf-history-search ]; then
git clone https://github.com/joshskidmore/zsh-fzf-history-search ~/.oh-my-zsh/custom/plugins/zsh-fzf-history-search
fi

# cd ~/.zsh
# git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
# cd zsh-syntax-highlighting/themes/

pip3 install thefuck
pip3 install llm 
pip3 install llm-openrouter
# change to your provider here.
# llm keys set openrouter
sudo apt install autojump
