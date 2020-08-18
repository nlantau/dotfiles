" nlantau nvim config (init.vim)

" ----- Leader --------------------------------------------------------
let mapleader=","
let maplocalleader="-"

" ----- neovim3 venv --------------------------------------------------
let g:python3_host_prog ='$VIRENVDIR/neovim3/bin/python'

" ----- vim-plug ------------------------------------------------------
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/deoplete.nvim', {'do':':UpdateRemotePlugins'}
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'darfink/vim-plist'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'neomake/neomake'
call plug#end()

" ----- Leader & Mappings ---------------------------------------------
let NERDTreeShowHidden=1

" ----- Gruvbox -------------------------------------------------------
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_invert_selection = 0


let g:isLight=1

function ToggleBG()
	if g:isLight == 0
		set background=light
		let g:isLight=1
	else
		set background=dark
		let g:isLight = 0
	endif
endfunction

nnoremap <Leader>cc :call ToggleBG()<CR>


" ----- plist  --------------------------------------------------------
let g:plist_display_format = 'xml'

" ----- Airline -------------------------------------------------------
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" ----- Deoplete ------------------------------------------------------
let g:deoplete#enable_at_startup = 1

" ----- Python --------------------------------------------------------
"let g:neomake_python_pep8_exe = 'python3'
"let g:neomake_python_enable_makers = ['pep8']
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()

" Flake8 when save
autocmd BufWritePost * Neomake

augroup type_python
	au!
	au FileType python setlocal expandtab
	au FileType python setlocal tabstop=4
	au FileType python setlocal softtabstop=4
	au FileType python setlocal shiftwidth=4
	" Find next "("
	au FileType python nnoremap <buffer> <LocalLeader>f :normal f(<CR>
	" Comment
	au FileType python nnoremap <buffer> <LocalLeader>c :normal I#<CR>
	" clear whitespace
	au BufWritePre python :%s/\s\+$//e
augroup END


" ----- Git Fugitive --------------------------------------------------
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gd :Git difftool<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>ge :Gedit<CR>

" ----- FZF & Buffers -------------------------------------------------
let g:fzf_buffers_jump = 1

nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>f :Files ~/<CR>
nnoremap <Leader>t :bd<CR>
nnoremap <Leader>l :ls<CR>:b<space>

" Split buffer 
nnoremap <Leader>s :ls<CR>:sb

" Vertical split buffer
nnoremap <Leader>vs :ls<CR>:vert sb

" Terminal buffer 
tnoremap <Esc> <C-\><C-n>

" ----- Neovim --------------------------------------------------------
nnoremap <Leader>sv :source $NVIMRC<CR><ESC>

" ----- Navigation ----------------------------------------------------
nnoremap <S-j> 10j<CR>
vnoremap <S-j> 10j<CR>
nnoremap <S-k> 10k<CR>
vnoremap <S-k> 10k<CR>
nnoremap <S-d> <C-d>
nnoremap <S-u> <C-u>

" ----- Marking -------------------------------------------------------
nnoremap ' `

" ----- Clear Highlight -----------------------------------------------
nnoremap <ESC> :noh<CR><ESC>

" ----- Save And Close ------------------------------------------------
inoremap jk <ESC>
"vnoremap jk <ESC>
nnoremap <Leader><Leader> :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" ----- Split Navigation & Window Resize ------------------------------
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

nnoremap <Silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <Silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" ----- Substitue map -------------------------------------------------
nnoremap S :%s//g<Left><Left>

" ----- Register map --------------------------------------------------
nnoremap <Leader>r :reg<CR>

" ----- Vertical Split init.vim ---------------------------------------
nnoremap <Leader>v :vsplit $XDG_CONFIG_HOME/nvim/init.vim<CR>

" ----- NERDTree map --------------------------------------------------
nnoremap <Leader>b :NERDTreeToggle<CR>

" ----- Coloring ------------------------------------------------------
syntax enable
colorscheme gruvbox

" ----- Editor Config -------------------------------------------------
set encoding=UTF-8
set clipboard=unnamed

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

set number
set relativenumber
set wrap
set wrapmargin=8
set showbreak=↪
set autoindent
set so=7
set showmatch
set cursorline
set wildmenu   " visual autocomplete for command menu

" Tab control
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

set showcmd
set laststatus=2
set nobackup
set noswapfile
set updatetime=100
set splitbelow
set splitright

" Buffers
set hidden

" Specific spacing depening on filetype
autocmd FileType sh setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2


" end init.vim
