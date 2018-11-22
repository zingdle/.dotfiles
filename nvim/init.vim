if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" color scheme
Plug 'chriskempson/base16-vim'

" air line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" welcome page
Plug 'mhinz/vim-startify'

" indent line
Plug 'Yggdroot/indentLine'

" underline all the word under the cursor
Plug 'itchyny/vim-cursorword'

" <leader>ci toggle comment
Plug 'scrooloose/nerdcommenter'

" fast moves
" <leader><leader>w/b find following/previous word
" <leader><leader>j/k find following/previous line
" <leader><leader>h/l find within this line
" <leader><leader>s find with search
Plug 'easymotion/vim-easymotion'

" pair brackets
Plug 'Raimondi/delimitMate'

" surround
" cs"' change surround from " to '
" ds" delete surround "
" ysiw" add current word by surround "
Plug 'tpope/vim-surround'

" git support
Plug 'airblade/vim-gitgutter'

" formatter
Plug 'Chiel92/vim-autoformat'

" syntax highlight for cpp
Plug 'octol/vim-cpp-enhanced-highlight'

" ycm
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

" show doc
Plug 'Shougo/echodoc.vim'


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'w0rp/ale'

Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

" Multi-entry selection UI. FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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

" leave space
set scrolloff=10

" highlight current line
set cursorline

" tab
set tabstop=4
set shiftwidth=4
set expandtab

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

" don't show mode
set noshowmode

"map jj to esc..
inoremap jj <c-[>
cnoremap <expr> j getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'
inoremap j<Space> j
cnoremap j<Space> j

" vim-gitgutter
set updatetime=100

" nerdcommenter
let g:NERDSpaceDelims=1

" vim-autoformat
let g:formatters_python = ['autopep8']
au BufWrite * :Autoformat

" ycm
let g:ycm_min_num_identifier_candidate_chars=2
set completeopt=menu,menuone
nnoremap <leader>p :vs \| YcmCompleter GoToDefinition<cr>
nnoremap <leader>g :YcmCompleter GoToDefinition<cr>

let g:ycm_semantic_triggers={
            \ 'c,cpp,python': ['re!\w{2}'],
            \ }
let g:ycm_filetype_whitelist = {
            \ "c": 1,
            \ "cpp": 1,
            \ }

" echodoc
let g:echodoc#enable_at_startup=1




" deoplete
let g:deoplete#enable_at_startup=1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" ale
let g:ale_sign_column_always=1
let g:airline#extensions#ale#enabled=1

" LC
let g:LanguageClient_serverCommands={
            \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
            \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
            \ }

let g:LanguageClient_loadSettings=1
let g:LanguageClient_settingsPath='/home/zingdle/.config/nvim/lsp_settings.json'
let g:LanguageClient_diagnosticsEnable=0

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
