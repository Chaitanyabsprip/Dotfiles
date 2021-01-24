" Alt+s will source init.vim/.vimrc
nnoremap <silent> <M-s> :source $MYVIMRC<CR>
inoremap <silent> <M-s> :source $MYVIMRC<CR>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Go to start or end of line easier
nnoremap H ^
xnoremap H ^
nnoremap L g_
xnoremap L g_

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

"terminal binds
tnoremap <silent> <Esc> <C-\><C-n>
tnoremap <A-[> <C-\><C-n>
tnoremap jk  <C-\><C-n>
tnoremap kj  <C-\><C-n>
" autocmd Filetype rnvimr tunmap! <buffer><nowait> jk
" autocmd Filetype rnvimr tunmap! <buffer><nowait> kj

"move lines up and down
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

"add blank lines on top or bottom of the current line
nnoremap <silent> <c-j> o<Esc>k
nnoremap <silent> <c-k> O<Esc>j

" Better tabbing
nmap <Tab> >>
nmap <S-tab> <<
vnoremap < <gv
vnoremap > >gv

" Insert a space after current character
nnoremap <silent> <Space><Space> a<Space><ESC>h

" check the syntax group of current cursor position
nnoremap <silent> <leader>st :call utils#SynGroup()<CR>

let mapleader = " "
nmap <silent><leader>w :w!<cr>

nnoremap <silent><expr> <Leader>nl (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows keymap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"move between open windows
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>

"move windows accordingly
nnoremap <silent><leader>H :wincmd H<CR>
nnoremap <silent><leader>J :wincmd J<CR>
nnoremap <silent><leader>K :wincmd K<CR>
nnoremap <silent><leader>L :wincmd L<CR>

"close current window
nnoremap <silent><leader>q :wincmd q<CR>

"window resize
nnoremap <silent> ) :vertical resize +5<CR>
nnoremap <silent> ( :vertical resize -5<CR>
nnoremap <silent> + :res +1<CR>
nnoremap <silent> - :res -1<CR>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" TAB in general mode will move between tabs
nnoremap <TAB> gt
nnoremap <S-TAB> gT
nnoremap gF :tabe <cfile><CR>

" move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bd<CR>

" get syntax/highlight group of the word under cursor
function! <SID>SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <C-P> :call <SID>SynStack()<CR>

" open links in browser
nnoremap <leader>ol :silent !xdg-open <C-R>=escape("<C-R><C-F>", "#?&;\|%")<CR><CR><CR>
" nnoremap <leader>e <cmd>CHADopen<cr>
