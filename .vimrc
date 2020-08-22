" nlantau .vimrc
" My intentions are to keep my .vimrc small with 
" only 'necessary' plugins.
" I'll keep some mappings, while trying to
" change habbit of using commands instead



" ----- Leader --------------------------------------------------------------
let mapleader=","
let maplocalleader=","
filetype plugin indent on
syntax on

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
Plug 'andviro/flake8-vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
colorscheme gruvbox


" ----- Pop Up Tabbing ------------------------------------------------------
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" ----- Airline -------------------------------------------------------------
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


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
augroup END


" ----- au python -----------------------------------------------------------
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe'

augroup myPython
	au!
	au FileType python setlocal expandtab
	au FileType python setlocal tabstop=4
	au FileType python setlocal shiftwidth=4
	au FileType python setlocal softtabstop=4
  au FileType python nnoremap <buffer> <LocalLeader>r :w<CR>:!clear;python3 %<CR>
augroup END


" ----- .vimrc --------------------------------------------------------------
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>vv :vsplit $MYVIMRC<CR>

nnoremap ' `
inoremap jk <ESC>
tnoremap <Esc> <C-\><C-n>
nnoremap <Leader><ESC> :noh<CR><ESC>
nnoremap <Leader>nt :NERDTreeToggle<CR>

" ----- Save And Close ------------------------------------------------
nnoremap <Leader>x :x<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader><Leader> :w<CR>


" ----- Git Fugitive --------------------------------------------------
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Git difftool<CR>


" ----- Navigation ----------------------------------------------------
nnoremap <S-d> <C-d>
nnoremap <S-u> <C-u>
nnoremap <S-j> 10j<CR>
vnoremap <S-j> 10j<CR>
nnoremap <S-k> 10k<CR>
vnoremap <S-k> 10k<CR>


" -----  Buffers ------------------------------------------------------
nnoremap <C-n> :bnext<CR>
nnoremap <Leader>bc :bd<CR>
nnoremap <Leader>sb :ls<CR>:sb
nnoremap <Leader>vs :ls<CR>:vert sb
nnoremap <Leader>bl :ls<CR>:b<space>


" ----- Split Navigation & Window Resize ------------------------------
nnoremap <C-c> <C-w>c
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
set ruler
set showcmd
set nobackup
set splitright
set splitbelow
set noswapfile
set cmdheight=1
set laststatus=2
set nowritebackup
set updatetime=100
