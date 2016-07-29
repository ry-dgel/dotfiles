"Syntax Highlighting
syntax on

"Play nice with buffers
set hidden

"Nicer Word Wrapping
set linebreak

"Line Break Travelling
set whichwrap=b,s,<,>,[,]

"Wrapped Line Travelling
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"Line Numbers
set number
set relativenumber

"Remove Normal Mode Lag
set ttimeoutlen=50

"Spell Check
"set spell

"filetype Detection
"filetype indent plugin on

"Encoding
set encoding=utf-8

"Auto detect outside changes
set autoread

"Show Current Position
set ruler

"Height of command Bar
set cmdheight=2

"Hide Buffers
set hid

"Nice Backspace
set backspace=eol,start,indent

"Better Search
set ignorecase
set smartcase
set hlsearch
set incsearch

"Matching Brackets
set showmatch
set mat=2

"Remove annoying ~ files
set nobackup
set nowb
set noswapfile

"Tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
set wrap
set autoindent

"Cursor Highlight
:hi CursorLine  cterm=NONE ctermbg=0 ctermfg=NONE guibg=NONE guifg=NONE
:hi CursorColumn  cterm=NONE ctermbg=0 ctermfg=NONE guibg=NONE guifg=NONE
:nnoremap <Leader>r :set cursorline! cursorcolumn!<CR>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"Vim-Plug
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'benekastah/neomake'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
Plug 'jiangmiao/auto-pairs'
Plug 'chriskempson/base16-vim'
Plug 'lervag/vimtex'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'romainl/Apprentice'
Plug 'jpo/vim-railscasts-theme'
Plug 'ajh17/Spacegray.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

"airline
set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '█▓'
" Disable powerline arrows and setting blank seperators creates a rectangular box
let g:airline_left_sep = '█▓░'
let g:airline_right_sep = '░▓█'

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"vimtex
let g:vimtex_latxmk_progname = 'nvr'
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'mupdf'

"nerdtree
"autocmd vimenter * if !argc() | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>

" Close vim when a file is closed and NERDTree is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"YouCompleteMe
let g:ycm_show_diagnostics_ui = 0 "Disable diagnostics, to allow syntastic

"Colors
let g:gruvbox_termcolors=16
set background=dark
let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox

"transparency
function! AdaptColorscheme()
	highlight clear CursorLine
	highlight Normal ctermbg=none guibg=none
	highlight LineNr ctermbg=none guibg=none
	highlight Folded ctermbg=none guibg=none
	highlight NonText ctermbg=none guibg=none
	highlight SpecialKey ctermbg=none guibg=none
	highlight VertSplit ctermbg=none guibg=none
	highlight SignColumn ctermbg=none guibg=none
endfunction

autocmd VimEnter * call AdaptColorscheme()
