" nlantau nvim config (init.vim)

if !exists('g:vscode')

" ----- neovim3 venv --------------------------------------------------
let g:python3_host_prog ='$HOME/.virtualenvs/neovim3/bin/python'

" ----- vim-plug ------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'                          " NERDTree
Plug 'vim-airline/vim-airline'                      " better statusline
Plug 'vim-airline/vim-airline-themes'               " ... this too
Plug 'tpope/vim-fugitive'                           " git commands
Plug 'airblade/vim-gitgutter'                       " git in statusbar
Plug 'morhetz/gruvbox'                              " Current theme
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/deoplete.nvim', {'do':':UpdateRemotePlugins'}
Plug 'deoplete-plugins/deoplete-jedi'
call plug#end()

" ----- Leader & Mappings ---------------------------------------------
let mapleader=","                                   " leader is comma
let NERDTreeShowHidden=1

" ----- Gruvbox -------------------------------------------------------
let g:gruvbox_contrast_dark = 'hard'

" ----- Airline -------------------------------------------------------
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0

" ----- Navigation ----------------------------------------------------
nmap <S-j> 10j                                      
vmap <S-j> 10j                                      

nmap <S-k> 10k                                      
vmap <S-k> 10k                                      

nmap <S-d> <C-d>                                    
nmap <S-u> <C-u>                                    

" ----- Save And Close ------------------------------------------------
nmap <leader>w :w<CR>                               
nmap <leader>x :x<CR>                               
nmap <leader>q :q<CR>                               
nmap <Leader>Q :q!<CR>                              

" ----- Split Navigation & Window Resize ------------------------------
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" ----- Python map ----------------------------------------------------
nnoremap <Leader>r :!python3 %<CR>

" ----- Deoplete ------------------------------------------------------
let g:deoplete#enable_at_startup = 1

" ----- Vertical Split init.vim ---------------------------------------
nnoremap <Leader>v :vsplit ~/.config/nvim/init.vim<CR>

" ----- NERDTree map --------------------------------------------------
map <C-b> :NERDTreeToggle<CR>

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
set laststatus=0                                " window will always have a status line
set nobackup noswapfile
set updatetime=100                              " default = 4000
set splitbelow splitright

endif                                           " g:vscode





" end init.vim
