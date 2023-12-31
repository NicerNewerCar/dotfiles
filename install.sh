echo "Installing dependencies"
sudo apt install zsh tmux python3 python3-venv
echo "Linking zsh"
ln -s $(pwd)/zshrc ~/.zshrc
echo "Linking tmux"
ln -s $(pwd)/tmux.conf ~/.tmux.conf
echo "Linking nvim"
ln -s $(pwd)/nvim/ ~/.config/nvim
echo "Setting nvim as default git editor"
git config --global core.editor "nvim"
