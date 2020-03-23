""""""""""""""Kevin's VIMRC""""""""""""""

" Make sure this isn't running in vscode nvim extenstion
if !exists('g:vscode')

""""""""""""""PLUGIN MANAGER""""""""""""""
if empty(glob("~/.config/nvim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

""""""""""""""PLUGINS""""""""""""""

" Plug - plugin manager
call plug#begin('~/.config/nvim/plugged')

" Deoplete - async autocompletion
Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
" tab-complete
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

" Ultisnips - snippet manager
Plug 'SirVer/ultisnips'
" let g:UltiSnipsSnippetsDir = "~/.config/nvim/snippets"
let g:UltiSnipsExpandTrigger='<leader>e'
let g:UltiSnipsJumpForwardTrigger='<leader>r'
let g:UltiSnipsJumpBackwardTrigger='<leader>w'

" Vim-Snippets - collections of snippets
Plug 'honza/vim-snippets'

" Deoplete-jedi - python autocompletion
Plug 'zchee/deoplete-jedi'
let g:deoplete#jedi#enable_cache = 1
let g:deoplete#jedi#python_path = '/usr/bin/python3'

" Airline - status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_detect_whitespace = 0
let g:airline#extensions#tabline#enabled = 1

" Tender - colorscheme
Plug 'jacoborus/tender.vim'

" Nerdtree - directory tree
Plug 'scrooloose/nerdtree'

" Nerdtree tabs - persist nerdtree across all tabs
Plug 'jistr/vim-nerdtree-tabs'

call plug#end()

" colorscheme tender
let $NVIM_TUI_ENABLE_TRUE_COLOR=0
" set termguicolors
let g:airline_theme = 'deus'

" end check for vscode
endif

""""""""""""""SPACING""""""""""""""
syntax enable	" enable syntax processing
set tabstop=4	" number of spaces visually per tab
set softtabstop=4	" number of spaces inserted per tab
set shiftwidth=4
set expandtab	" tabs are spaces

""""""""""""""VISUAL""""""""""""""
set number	" show line numbers
set cursorline	" highlight current line
filetype indent on	" load filetype-specific indent files
set wildmenu	" visual autocomplete
set showmatch	" highlight matching [{()}]
set incsearch	" search as characters are entered

""""""""""""""MOVEMENT""""""""""""""
" move vertically by visual line
nnoremap j gj
nnoremap k gk

""""""""""""""WINDOWS""""""""""""""
" Window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
" Split window vertically
nmap <leader>v <C-w>v<C-w>l
" Split window horizontally
nmap <leader>s <C-w>s<C-w>j
" Close current split
nmap <leader>x <C-w>q

""""""""""""""TABS""""""""""""""
" Browser-like tab navigation
nnoremap <C-o> :tabprevious<CR>
nnoremap <C-p> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-o> <Esc>:tabprevious<CR>i
inoremap <C-p> <Esc>:tabnext<CR>i
inoremap <C-t> <Esc>:tabnew<CR>

""""""""""""""CLIPBOARD""""""""""""""
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

