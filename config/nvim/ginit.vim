augroup sourceinit
  autocmd!
  autocmd! BufWritePost ~\.config\nvim\ginit.vim source ~\.config\nvim\ginit.vim
augroup end

" To check if neovim-qt is running, use `exists('g:GuiLoaded')`,
" see https://github.com/equalsraf/neovim-qt/issues/219
if exists('g:GuiLoaded')
    if has('gui_running')
      au GUIEnter * set fullscreen
    endif
    call GuiWindowMaximized(1)
    GuiTabline 0
    GuiPopupmenu 0
    GuiLinespace 2
    GuiFont! Hack:h10:l
    set guioptions+=T
    set guioptions-=m
    set guioptions+=d
    set guioptions+=!

    " Use shift+insert for paste inside neovim-qt,
    " see https://github.com/equalsraf/neovim-qt/issues/327#issuecomment-325660764
    " inoremap <silent>  <S-Insert>  <C-R>+
    " cnoremap <silent> <S-Insert> <C-R>+

    " For Windows, Ctrl-6 does not work. So we use this mapping instead.
    " nnoremap <silent> <C-6> <C-^>
endif
