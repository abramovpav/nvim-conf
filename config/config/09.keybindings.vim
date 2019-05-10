:let mapleader = " "

:nnoremap <leader>sc :let @/=""<cr>

:nnoremap <leader>ve :vsplit ~/.config/nvim/config<cr>
:nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>

:nnoremap <leader>wh <C-w>h
:nnoremap <leader>wj <C-w>j
:nnoremap <leader>wk <C-w>k
:nnoremap <leader>wl <C-w>l

:nnoremap <leader>af :ALEFix<cr>

:nnoremap <leader>sf :FZF<cr>
:nnoremap <leader>st :Tags<cr>
:nnoremap <leader>sb :Buffers<cr>
command! -bang -nargs=* AgExact call fzf#vim#ag(<q-args>, '-Q', <bang>0)
command! -bang -nargs=* AgWords call fzf#vim#ag(<q-args>, '-Q -w', <bang>0)
command! -bang -nargs=* AgCs call fzf#vim#ag(<q-args>, '-s', <bang>0)
command! -bang -nargs=* AgCsExact call fzf#vim#ag(<q-args>, '-Q -s', <bang>0)
command! -bang -nargs=* AgCsWords call fzf#vim#ag(<q-args>, '-Q -w -s', <bang>0)
:nnoremap <leader>sar :Ag<space>
:nnoremap <leader>sae :AgExact<space>
:nnoremap <leader>saw :AgWords<space>
:nnoremap <leader>sase :AgCsExact<space>
:nnoremap <leader>sasw :AgCsWords<space>
:nnoremap <leader>sasr :AgCs<space>

:inoremap jk <esc>
:inoremap <esc> <nop>

:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"