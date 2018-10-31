if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" terminal enhancement
Plug 'wincent/terminus'

" color scheme
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'

" welcome page
Plug 'mhinz/vim-startify'

" indent line
Plug 'Yggdroot/indentLine'

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
Plug 'easymotion/vim-easymotion'

" pair brackets
Plug 'jiangmiao/auto-pairs'

" surround
" cs"' change surround from " to '
" ds" delete surround "
" ysiw" add current word by surround "
Plug 'tpope/vim-surround'

" git support
Plug 'airblade/vim-gitgutter'

" syntax highlight for cpp
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()


" map leader
let mapleader = " "

" color scheme
set termguicolors
color base16-onedark

" syntax highlight
syntax on

" line number
set number
set relativenumber

" highlight current line
set cursorline

" tab
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" search
set incsearch
set ignorecase
set smartcase

" split
set splitbelow
set splitright

" clipboard
set clipboard=unnamedplus

" wildmenu
set wildmenu

"map jj to esc..
inoremap jj <c-[>
cnoremap <expr> j
      \ getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'

inoremap j<Space>     j
cnoremap j<Space>     j

" vim-gitgutter
set updatetime=100
