" Vundle configuration
set nocompatible
filetype off

set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'

" Color scheme
Plugin 'whatyouhide/vim-gotham'

call vundle#end()
filetype plugin indent on

"Set Gotham City colorscheme and lightline
colorscheme gotham256
let g:lightline = { 'colorscheme' : 'gotham256' }

highlight ColorColumn ctermbg=0 guibg=lightgrey

"Start next line indented
set autoindent

"Make backspace work everywhere
set backspace=indent,eol,start

"Set a column specifying 80 characters limit per line
set colorcolumn=80

"A prompt will appears after leaving a unsaved section
set confirm

"Convert tabs to spaces
set expandtab

"Ignore uppercase and lowercase in the search
set ignorecase

"Display the line status (2: always)
set laststatus=2

"Mouse support (a:all modes [insert, visual, etc.])
set mouse=a

"Cursor is fixed in the same column when jumping to other lines
set nostartofline

"Show line numbers
set number

"Enable/disable pastetogle with F2 key
set pastetoggle=<F2>

"Define, with tab key, a 4 space width
set shiftwidth=4

"Show the commmands typed
set showcmd

"Will find only uppercase searches when specified
set smartcase

"Define indent with size 4
set tabstop=4

"Make the vim clipboard the same as system one
set clipboard=unnamedplus

"Enable highlight in the current line
set cursorline

"Enable syntax highlight
syntax on

"Show options to autocomplete
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction

" Remap tab key to autocomplete
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/share/dict/cracklib-small"

" Remap Crtl+T command to open a new tab
nnoremap <C-t> :tabnew<CR>

" Remap Ctrl+A command to open NERD Tree
map <C-a> :NERDTreeToggle<CR>

" Automatically closes vim when NERD Tree is the only file opened
autocmd bufenter * if (winnr("$") == 1
            \&& exists("b:NERDTree")
            \&& b:NERDTree.isTabTree()) | q | endif
