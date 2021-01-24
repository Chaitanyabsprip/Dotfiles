let g:floaterm_keymap_new = '<leader>tn'
let g:floaterm_keymap_prev = '<leader>tu'
let g:floaterm_keymap_next = '<leader>td'
let g:floaterm_keymap_kill = '<leader>tk'
let g:floaterm_keymap_toggle = '<leader>tt'

nnoremap   <silent>   <leader>tn    :FloatermNew<CR>
tnoremap   <silent>   <leader>tn    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <leader>tu    :FloatermPrev<CR>
tnoremap   <silent>   <leader>tu    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <leader>td    :FloatermNext<CR>
tnoremap   <silent>   <leader>td    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <leader>tk    :FloatermKill<CR>
tnoremap   <silent>   <leader>tk    <C-\><C-n>:FloatermKill<CR>
nnoremap   <silent>   <leader>tt   :FloatermToggle<CR>
tnoremap   <silent>   <leader>tt   <C-\><C-n>:FloatermToggle<CR>

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
