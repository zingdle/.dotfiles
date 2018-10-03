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

Plug 'Shougo/echodoc.vim'

Plug 'Chiel92/vim-autoformat'

Plug 'w0rp/ale'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'justinmk/vim-gtfo'

call plug#end()

" map leader
let mapleader = " "

" color scheme
color onedark

" syntax highlight
syntax on

" line number
set number
" set relativenumber

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
" nnoremap <C-t> : call Toggle_transparent()<cr>

" toggle shell by <C-t>
noremap <C-t> :sh<cr>

" nerdtree
nmap <leader>v :NERDTreeFind<cr>
nmap <leader>g :NERDTreeToggle<cr>

" vim-gitgutter
set updatetime=100

" auto save
let g:auto_save = 1

" nerdcommenter
let g:NERDSpaceDelims = 1

" youcompleteme
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

let g:ycm_semantic_triggers =  {
      \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
      \ 'cs,lua,javascript': ['re!\w{2}'],
      \ }
" let g:ycm_key_invoke_completion = '<c-z>'

set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

let g:ycm_show_diagnostics_ui = 0

" let g:ycm_complete_in_comments = 1

" echodoc.vim
let g:echodoc_enable_at_startup = 1
set cmdheight=2

" autoformat when saving
au BufWrite * :Autoformat

" ale
let g:ale_lint_on_text_changed = 'never'

" clipboard
set clipboard=unnamedplus

" tab navigation
let g:airline#extensions#tabline#enabled = 1
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprev<CR>
nnoremap <leader>w :bdelete<CR>

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
nnoremap j jzz
nnoremap k kzz
nnoremap G Gzz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

"map jj to esc..
inoremap jj <c-[>
cnoremap <expr> j
      \ getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'

inoremap j<Space>     j
cnoremap j<Space>     j
