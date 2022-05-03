" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'numToStr/Comment.nvim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'ellisonleao/glow.nvim', {'branch': 'main'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Plug 'valloric/youcompleteme'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'

Plug 'glepnir/dashboard-nvim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

let mapleader = "\<Space>" " prefix key dùng để trigger các function hay event 
filetype plugin on
filetype plugin indent on

" autocmd BufEnter * :set scroll=10 " set croll line 
syntax on

set guifont=Hack\ Nerd\ Font:h11
let g:airline_powerline_fonts = 1

let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:true
let g:bufferline.icon_custom_colors = v:true
let g:bufferline.tabpages = v:true

set encoding=UTF-8
set mouse=a " enable mouse trong context của neovim 

set incsearch 
set hlsearch  " hightlight text khi search 

set tabstop=4 " space mỗi lần tab
set softtabstop=0
set shiftwidth=4

" barbar.nvim: personal mappings
" Move to previous/next
nnoremap <silent> <Space>j :BufferPrevious<CR>
nnoremap <silent> <Space>l :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent> <Space>, :BufferMovePrevious<CR>
nnoremap <silent> <Space>. :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent> <Space>1 :BufferGoto 1<CR>
nnoremap <silent> <Space>2 :BufferGoto 2<CR>
nnoremap <silent> <Space>3 :BufferGoto 3<CR>
nnoremap <silent> <Space>4 :BufferGoto 4<CR>
nnoremap <silent> <Space>5 :BufferGoto 5<CR>
nnoremap <silent> <Space>6 :BufferGoto 6<CR>
nnoremap <silent> <Space>7 :BufferGoto 7<CR>
nnoremap <silent> <Space>8 :BufferGoto 8<CR>
nnoremap <silent> <Space>9 :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent> <Space>p :BufferPin<CR>
" Close buffer
nnoremap <silent> <Space>k :BufferClose<CR>

map <C-f> :Telescope<CR>

"NERDTree
map <C-b> :NERDTreeToggle<CR>
map <C-g> :NERDTreeFind<CR>

let g:NERDTreePatternMatchHighlightFullName = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeShowBookmarks=1

" Set split separator to Unicode box drawing character
set encoding=utf8
set fillchars=vert:│

let g:glow_style = "dark"

" Override color scheme to make split the same color as tmux's default
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE

set nu

lua require("lsp")
lua require("plugins")
lua require("Comment").setup()
