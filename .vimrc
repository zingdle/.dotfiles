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

Plug 'airblade/vim-gitgutter'

call plug#end()

" true color support for vim8+
if has("termguicolors")
    set termguicolors
endif

" map leader
let mapleader = ","

" color scheme
color onedark

" toggle transparency by <C-t>
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_transparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<cr>

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
