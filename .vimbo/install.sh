dir="$HOME/.vim/bundle/Vundle.vim"

cp .vimrc $HOME/.vimrc

if [ ! -n "${dir}" ]; then
    git clone https://github.com/VundleVim/Vundle.vim ${dir}
fi

vim +PluginInstall

