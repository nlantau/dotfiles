" nlantau nvim config (init.vim)

" ----- Leader --------------------------------------------------------
let mapleader=","                                   " Leader is comma

"if !exists('g:vscode')
"seems like vscode accepts current init.vim

" ----- neovim3 venv --------------------------------------------------
let g:python3_host_prog ='$VIRTENVDIR/neovim3/bin/python'

" ----- vim-plug ------------------------------------------------------
call plug#begin('$CONFIGDIR/nvim/plugged')
Plug 'scrooloose/nerdtree'                          " NERDTree
Plug 'vim-airline/vim-airline'                      " better statusline
Plug 'vim-airline/vim-airline-themes'               " ... this too
Plug 'tpope/vim-fugitive'                           " git commands
Plug 'airblade/vim-gitgutter'                       " git in statusbar
Plug 'morhetz/gruvbox'                              " Current theme
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/deoplete.nvim', {'do':':UpdateRemotePlugins'}
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'darfink/vim-plist'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
call plug#end()

" ----- Leader & Mappings ---------------------------------------------
let NERDTreeShowHidden=1

" ----- Gruvbox -------------------------------------------------------
let g:gruvbox_contrast_dark = 'hard'

" ----- plist  --------------------------------------------------------
let g:plist_display_format = 'xml'

" ----- Airline -------------------------------------------------------
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0

" ----- Deoplete ------------------------------------------------------
let g:deoplete#enable_at_startup = 1

" ----- FZF & Buffers -------------------------------------------------
let g:fzf_buffers_jump = 1

nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>f :Files ~/<CR>
nnoremap <Leader>t :bd<CR>
nnoremap <Leader>l :ls<CR>

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
nnoremap S :%s///g<Left><Left><Left>

" ----- Register map --------------------------------------------------
nnoremap <Leader>r :reg<CR>

" ----- Vertical Split init.vim ---------------------------------------
nnoremap <Leader>v :vsplit $CONFIGDIR/nvim/init.vim<CR>

" ----- NERDTree map --------------------------------------------------
nnoremap <Leader>b :NERDTreeToggle<CR>

" ----- Coloring ------------------------------------------------------
set background=dark
syntax enable
colorscheme gruvbox

" ----- Editor Config -------------------------------------------------
set encoding=UTF-8
set number relativenumber cursorline wildmenu   " visual autocomplete for command menu
set tabstop=4 softtabstop=4 expandtab	        " tabs are space
set autoindent copyindent
set clipboard+=unnamedplus
set showcmd                                     " show command in bottom bar
set laststatus=0
set nobackup noswapfile
set updatetime=100                              " default = 400
set splitbelow splitright

"endif                                           " g:vscode





" end init.vim
