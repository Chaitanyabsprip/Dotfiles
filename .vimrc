source ~/.config/nvim/settings/settings.vim
source ~/.config/nvim/settings/mapping.vim
source ~/.config/nvim/settings/autocommands.vim
source ~/.vim/plugs/plugs.vim
" let g:horizon_transparent_bg=1
colo horizon

function! <SID>SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <C-P> :call <SID>SynStack()<CR>

autocmd! BufWritePost $MYVIMRC source %
