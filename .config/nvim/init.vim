" nlantau nvim config (init.vim)

" ----- Leader --------------------------------------------------------
let mapleader=","
let maplocalleader="-"

" ----- neovim3 venv --------------------------------------------------
let g:python3_host_prog ='$VIRENVDIR/neovim3/bin/python'

" ----- vim-plug ------------------------------------------------------
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
Plug 'neomake/neomake'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'darfink/vim-plist'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'Shougo/deoplete.nvim', {'do':':UpdateRemotePlugins'}
call plug#end()

" ----- NERD et al ----------------------------------------------------
let NERDTreeShowHidden=1
let g:fzf_buffers_jump = 1
let g:plist_display_format = 'xml'
let g:deoplete#enable_at_startup = 1

" ----- Gruvbox -------------------------------------------------------
let g:gruvbox_invert_selection = 0
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'

let g:isLight=1
function! ToggleBG()
	if g:isLight == 0
		set background=light
		let g:isLight=1
	else
		set background=dark
		let g:isLight = 0
	endif
endfunction
nnoremap <Leader>tb :call ToggleBG()<CR>

" ----- Airline -------------------------------------------------------
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" ----- Jedi ----------------------------------------------------------
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" ----- Python --------------------------------------------------------
let g:neomake_open_list = 2
let g:neomake_python_pep8_exe = 'python3'
let g:neomake_python_enable_makers = ['pep8']
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()

" Flake8 when save
autocmd BufWritePost * Neomake
augroup type_python
	au!
	au FileType python setlocal expandtab
	au FileType python setlocal tabstop=4
	au FileType python setlocal shiftwidth=4
	au FileType python setlocal softtabstop=4
	au FileType python nnoremap <buffer> <LocalLeader>f :normal f(<CR>
	au FileType python nnoremap <buffer> <LocalLeader>c :normal I#<CR>
	au FileType python nnoremap <buffer> <LocalLeader>r :w<CR>:!python3 %<CR>
	au BufWritePre python :%s/\s\+$//e
augroup END

" ----- Pum -----------------------------------------------------------
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

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

" ----- Quickfix & Location List --------------------------------------
nnoremap <Leader>qc :ccl<CR>
nnoremap <Leader>lc :lcl<CR>
nnoremap <Leader>qo :copen<CR>
nnoremap <Leader>lo :lopen<CR>

" -----  Buffers ------------------------------------------------------
tnoremap <Esc> <C-\><C-n>
nnoremap <C-n> :bnext<CR>
nnoremap <Leader>tc :bd<CR>
nnoremap <Leader>sb :ls<CR>:sb
nnoremap <Leader>f :Files ~/<CR>
nnoremap <Leader>vs :ls<CR>:vert sb
nnoremap <Leader>bl :ls<CR>:b<space>

" ----- Neovim --------------------------------------------------------
nnoremap <Leader>sv :source $NVIMRC<CR><ESC>

" ----- Navigation ----------------------------------------------------
nnoremap <S-d> <C-d>
nnoremap <S-u> <C-u>
nnoremap <S-j> 10j<CR>
vnoremap <S-j> 10j<CR>
nnoremap <S-k> 10k<CR>
vnoremap <S-k> 10k<CR>

" ----- Marking -------------------------------------------------------
nnoremap ' `

" ----- Clear Highlight -----------------------------------------------
nnoremap <ESC> :noh<CR><ESC>

" ----- Save And Close ------------------------------------------------
inoremap jk <ESC>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader><Leader> :w<CR>

" ----- Split Navigation & Window Resize ------------------------------
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-c> <C-w>c
nnoremap <C-s> <C-w>s
nnoremap <C-v> <C-w>v
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <C-r>s <C-w>=<CR>
nnoremap <Silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <Silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" ----- Vertical Split init.vim ---------------------------------------
nnoremap <Leader>v :vsplit $NVIMRC<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap S :%s//g<Left><Left>
nnoremap <C-r> :reg<CR>

" ----- Coloring ------------------------------------------------------
syntax enable
colorscheme gruvbox

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

" Specific spacing depening on filetype
autocmd FileType sh setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2


" end init.vim
