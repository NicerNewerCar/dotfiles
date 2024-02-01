echo "Installing dependencies"
sudo apt install zsh tmux python3 python3-venv cargo
cargo install texlab
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Linking zsh"
ln -s $(pwd)/zshrc ~/.zshrc
echo "Linking tmux"
ln -s $(pwd)/tmux.conf ~/.tmux.conf
echo "Use <prefix>+I to install tmux plugins on first launch"
echo "Linking nvim"
ln -s $(pwd)/nvim/ ~/.config/nvim
echo "Setting nvim as default git editor"
git config --global core.editor "nvim"
