sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp .alias ~/.alias
cp .zshrc ~/.zshrc

cd ~/.oh-my-zsh/plugins

git clone https://github.com/zsh-users/zsh-completions 
git clone https://github.com/zsh-users/zsh-history-substring-search 
git clone https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search  
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git  
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git