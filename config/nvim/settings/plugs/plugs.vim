""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

  Plug 'dart-lang/dart-vim-plugin'
  Plug 'gerw/vim-HiLinkTrace'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'majutsushi/tagbar'
  Plug 'mbbill/undotree'
  Plug 'mhinz/vim-startify'
  Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
  " Plug 'sirver/ultisnips'
  Plug 'natebosch/dartlang-snippets'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
  Plug 'vim-scripts/indentpython.vim'
  Plug 'vimwiki/vimwiki'
  Plug 'voldikss/vim-floaterm'

"******************************      THEMES      *******************************
  Plug 'ayu-theme/ayu-vim'
  Plug 'haishanh/night-owl.vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'ntk148v/vim-horizon'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'yggdroot/indentline'
"*******************************************************************************
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.config/nvim/settings/plugs/floaterm.vim 
source ~/.config/nvim/settings/plugs/fzf.vim 
source ~/.config/nvim/settings/plugs/nvim-colorizer.vim 
source ~/.config/nvim/settings/plugs/nvim-treesitter.vim
source ~/.config/nvim/settings/plugs/undotree.vim 
source ~/.config/nvim/settings/plugs/startify.vim 
source ~/.config/nvim/settings/plugs/wiki.vim 
source ~/.config/nvim/settings/plugs/netrw.vim 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.config/nvim/settings/plugs/themes/dracula.vim 
source ~/.config/nvim/settings/plugs/themes/airline.vim 
source ~/.config/nvim/settings/plugs/themes/indent-line.vim 
source ~/.config/nvim/settings/plugs/themes/rainbow.vim 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stashed
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Plug 'buschco/vim-horizon'
  " Plug 'gruvbox-community/gruvbox'
  " Plug 'neovim/nvim-lspconfig'
  " Plug 'nvim-lua/completion-nvim'
  " Plug 'sheerun/vim-polyglot'
  " Plug 'valloric/youcompleteme'
  " Plug 'vim-syntastic/syntastic'
  " Plug 'wadackel/vim-dogrun'
" source ~/.config/nvim/settings/plugs/nvimlsp.vim 
" source ~/.config/nvim/settings/plugs/hexokinase.vim
" source ~/.config/nvim/settings/plugs/themes/ayu.vim 
" source ~/.config/nvim/settings/plugs/themes/palenight.vim 
" source ~/.config/nvim/settings/plugs/themes/gruvbox.vim 
source ~/.config/nvim/settings/plugs/coc.vim 
