" Vundle configuration
set nocompatible
filetype off

set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'

" Color scheme
Plugin 'sjl/badwolf'

call vundle#end()
filetype plugin indent on

colorscheme badwolf
highlight ColorColumn ctermbg=0 guibg=lightgrey
set autoindent
set backspace=indent,eol,start
set colorcolumn=80
set confirm
set expandtab
set ignorecase
set laststatus=2
set mouse=a
set nostartofline
set number
set pastetoggle=<F2>
set shiftwidth=4
set showcmd
set smartcase
set tabstop=4
syntax on

function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/share/dict/cracklib-small"

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" Crtl+T to new tab
nnoremap <C-t>     :tabnew<CR>

