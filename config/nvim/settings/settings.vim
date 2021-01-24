syntax enable
set autoread
set background=dark
set backspace=eol,start,indent
set belloff=all
set clipboard=unnamedplus
set cmdheight=1
set colorcolumn=81
set completeopt+=noinsert,menuone,preview
set conceallevel=0
set cursorline
set encoding=utf-8
set expandtab
set fileformat=unix
set fileencoding=utf-8
filetype plugin on
set hidden
set incsearch
set linespace=20
set mouse=a
set nobackup
set nohlsearch
set noswapfile
set nowrap
set nowritebackup
set nu rnu
set numberwidth=1
set scrolloff=16
set shell=/usr/bin/fish
set shiftwidth=2
set showtabline=1
set smartcase
set splitright
set t_Co=256
set tabstop=2 softtabstop=2
set termguicolors
set textwidth=80
set undodir=~/.tmp/undodir
set undofile
set wildmenu
set updatetime=50

" Split window below/right when creating horizontal/vertical windows
set splitbelow splitright

" Character to show before the lines that have been soft-wrapped
set showbreak=↪

"indent
set autoindent
set cindent
set smartindent

" code folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99

let $TMP = "/home/chaitanya/.tmp"

set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set pyxversion=3

augroup Notes
  autocmd!
  autocmd BufWritePost *note-*.md silent !buildNote %:p
augroup end
command! ShowNote silent !showNote
command! Gruvbox silent colorscheme gruvbox <bar> let g:airline_theme='base16_chalk'

if has('nvim')
  set inccommand=nosplit
endif
