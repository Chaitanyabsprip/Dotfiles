let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 15
let g:netrw_altv = 1

function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
" map <silent> <C-E> :call ToggleVExplorer()<CR>

augroup netrw
  autocmd!
  autocmd Filetype netrw nmap <buffer> l <cr>
  autocmd Filetype netrw nmap <buffer> h gg<cr>
  autocmd Filetype netrw nmap <buffer> q <leader>q
augroup end
