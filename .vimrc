syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'https://github.com/Valloric/YouCompleteMe'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader=' '
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

"ag is fast enough that CtrlP does't need to cache"

let g:ctrlp_use_caching = 0
