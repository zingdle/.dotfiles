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

" show doc
Plug 'Shougo/echodoc.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

" Multi-entry selection UI. FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'





Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'


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

" completer
set completeopt=menu,menuone

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
let g:NERDSpaceDelims=1

" vim-autoformat
let g:formatters_python = ['autopep8']
au BufWrite * :Autoformat

" echodoc
let g:echodoc#enable_at_startup=1

" deoplete
let g:deoplete#enable_at_startup=1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" LC
set scl=yes
let g:LanguageClient_serverCommands={
            \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
            \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
            \ }

let g:LanguageClient_loadSettings=1
let g:LanguageClient_settingsPath='/home/zingdle/.config/nvim/lsp_settings.json'

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" NERDTree
map <leader>t :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1
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

" tab
nnoremap <leader>h gt
nnoremap <leader>l gT

" terminal
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

let g:term_buf = 0
function! Term_toggle()
    1wincmd w
    if g:term_buf == bufnr("")
        setlocal bufhidden=hide
        close
    else
        rightbelow new
        12winc -
        try
            exec "buffer ".g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        set laststatus=0
        startinsert!
    endif
endfunction
nnoremap <f4> :call Term_toggle()<cr>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
" When switching to terminal windows it goes into insert mode automatically
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
