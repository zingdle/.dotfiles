if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" terminal enhancement
Plug 'wincent/terminus'

" color scheme
Plug 'joshdick/onedark.vim'

" welcome page
Plug 'mhinz/vim-startify'

" airline
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

" git support
Plug 'airblade/vim-gitgutter'

" auto save
Plug '907th/vim-auto-save'

" code-completion
Plug 'Valloric/YouCompleteMe'

" window split
Plug 'roman/golden-ratio'

call plug#end()

" map leader
let mapleader = ","

" color scheme
color onedark

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

" search while typing
set incsearch

" toggle transparency by <C-t>
let t:is_transparent = 0
function! Toggle_transparent()
    silent! w
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_transparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<cr>

" toggle shell by <C-d>
noremap <C-d> :sh<cr>

" nerdtree
nmap <leader>v :NERDTreeFind<cr>
nmap <leader>g :NERDTreeToggle<cr>

" vim-gitgutter
set updatetime=100

" auto save
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" nerdcommenter
let g:NERDSpaceDelims = 1

" youcompleteme
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

" clipboard
set clipboard=unnamedplus

" tab navigation
let g:airline#extensions#tabline#enabled = 1
nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprev<CR>

" resize current buffer by +/- 5 
nnoremap <C-left> :vertical resize -5<cr>
nnoremap <C-right> :vertical resize +5<cr>
nnoremap <C-down> :resize +5<cr>
nnoremap <C-up> :resize -5<cr>

" hard mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" smooth scroll
noremap j jzz
noremap k kzz
nnoremap G Gzz
