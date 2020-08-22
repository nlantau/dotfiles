" nlantau .vimrc


" ----- Leader --------------------------------------------------------------
let mapleader=","
let localmapleader="-"

" ----- Vim Plug ------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
call plug#end()

" ----- Gruvbox -------------------------------------------------------------
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'

let g:isLight=1
function! ToggleBG()
	if g:isLight == 0
		set background=light
		let g:isLight=1
	else
		set background=dark
		let g:isLight=0
	endif
endfunction
nnoremap <Leader>tb :call ToggleBG()<CR>

" ----- Color ---------------------------------------------------------------
syntax enable
colorscheme gruvbox

" ----- au Vim --------------------------------------------------------------
augroup myVim
	au!
	au FileType vim setlocal expandtab
	au FileType vim setlocal tabstop=2
	au FileType vim setlocal shiftwidth=2
	au FileType vim setlocal softtabstop=2
augroup END

" ----- au sh ---------------------------------------------------------------
augroup mySh
	au!
	au FileType sh setlocal expandtab
	au FileType sh setlocal tabstop=2
	au FileType sh setlocal shiftwidth=2
	au FileType sh setlocal softtabstop=2


" ----- .vimrc --------------------------------------------------------------
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Clear highlight
nnoremap <ESC> :noh<CR><ESC>

" Marking
nnoremap ' `

" Escape terminal inside vim
tnoremap <Esc> <C-\><C-n>


" ----- Save And Close ------------------------------------------------

" Escape insert mode with 'jk'
inoremap jk <ESC>

nnoremap <Leader>x :x<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader><Leader> :w<CR>


" ----- Navigation ----------------------------------------------------
nnoremap <S-d> <C-d>
nnoremap <S-u> <C-u>
nnoremap <S-j> 10j<CR>
vnoremap <S-j> 10j<CR>
nnoremap <S-k> 10k<CR>
vnoremap <S-k> 10k<CR>


" ----- Split Navigation & Window Resize ------------------------------
nnoremap <C-c> <C-w>c
nnoremap <C-s> <C-w>s
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-r>s <C-w>=<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <Silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>


" ----- Editor Config -------------------------------------------------
set encoding=UTF-8
set clipboard=unnamed

" Searching
set hlsearch
set smartcase
set incsearch
set ignorecase

" General
set so=7
set wrap
set number
set hidden
set wildmenu
set showmatch
set autoindent
set cursorline
set showbreak=↪
set wrapmargin=8
set relativenumber

" Tab control
set smarttab
set tabstop=4
set shiftround
set shiftwidth=4
set softtabstop=4

set showcmd
set nobackup
set splitright
set splitbelow
set noswapfile
set cmdheight=1
set laststatus=2
set nowritebackup
set updatetime=100
