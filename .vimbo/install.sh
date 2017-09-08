vdir="$HOME/.vim/bundle/Vundle.vim"

cp .vimrc $HOME/.vimrc

if [ ! -d "${vdir}" ]; then
    git clone https://github.com/VundleVim/Vundle.vim ${vdir}
fi

vim +PluginInstall