" pip3 install neovim
" sudo apt install clang-format
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.local/share/nvim/plugged')

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

" nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'

" show doc
Plug 'Shougo/echodoc.vim'

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

" fzf
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
" set relativenumber

" leave space
set scrolloff=7

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

" windows resize
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>

"map jj to esc..
inoremap jj <c-[>
cnoremap <expr> j getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'
inoremap j<Space> j
cnoremap j<Space> j

" vim-gitgutter
set updatetime=100

" nerdcommenter
let g:NERDSpaceDelims = 1

" vim-autoformat
let g:formatters_python = ['autopep8']

" NERDTree
map <leader>t :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1
let NERDTreeShowHidden = 1
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }

" echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'
set noshowmode

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" LC
set signcolumn=yes
let g:LanguageClient_serverCommands = {
            \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
            \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
            \ }
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '/home/zingdle/.config/nvim/settings.json'
let g:LanguageClient_hasSnippetSupport = 0

function SetLSPShortcuts()
    nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
    nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
    nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
    nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
    nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
    nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
    nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
    nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
    nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
    nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
    autocmd!
    autocmd FileType cpp,c call SetLSPShortcuts()
augroup END


" window
" split
nnoremap <leader>w\ :vs<CR>
nnoremap <leader>w- :split<CR>

" navigation
nnoremap <leader>ww <C-w><C-w>
nnoremap <leader>wj <C-w><C-j>
nnoremap <leader>wk <C-w><C-k>
nnoremap <leader>wh <C-w><C-h>
nnoremap <leader>wl <C-w><C-l>

" close
nnoremap <leader>wc <C-w>c
