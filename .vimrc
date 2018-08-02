call plug#begin('~/.vim/plugged')

" color scheme
Plug 'joshdick/onedark.vim'

" welcome page
Plug 'mhinz/vim-startify'

" airline below
Plug 'bling/vim-airline'

" comment
" <leader>ci Toggle the comment state of selected lines
Plug 'scrooloose/nerdcommenter'

" indent line
Plug 'Yggdroot/indentLine'

" ctrl-p
Plug 'ctrlpvim/ctrlp.vim'

" file sidebar
" <leader>v Find file in nerdtree
" <leader>g Toggle nerdtree
Plug 'scrooloose/nerdtree'

" underline all the word under the cursor
Plug 'itchyny/vim-cursorword'

" fast moves
" <leader><leader>w find following word
" <leader><leader>b find previous word
" <leader><leader>j find following line
" <leader><leader>k find previous line
" <leader><leader>h find within this line
" <leader><leader>l find within this line
" <leader><leader>s find with search
" 
Plug 'easymotion/vim-easymotion'

" highlight all search result
"Plug 'haya14busa/incsearch.vim'

" pair brackets
Plug 'jiangmiao/auto-pairs'

" surround
" cs"' change surround from " to '
" ds" delete surround "
" ysiw" add current word by surround "
Plug 'tpope/vim-surround'

" multiple cursors
" <C-n> select current word(or use v/V to visual mode to select)
" <C-n> select next same word
" c change multiple words
Plug 'terryma/vim-multiple-cursors'

call plug#end()

" map leader
let mapleader = ","

" color scheme
color onedark

" nerdtree
nmap <leader>v :NERDTreeFind<cr>
nmap <leader>g :NERDTreeToggle<cr>

" syntax highlight
syntax on

" line number
set number
set relativenumber

" highlight current line
set cursorline

" tab
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" search while typing
set incsearch
