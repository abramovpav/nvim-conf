:let mapleader = " "

:nnoremap <leader>sc :let @/=""<cr>

:nnoremap <leader>ve :vsplit ~/.config/nvim/config<cr>
:nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>

:nnoremap <leader>wh <C-w>h
:nnoremap <leader>wj <C-w>j
:nnoremap <leader>wk <C-w>k
:nnoremap <leader>wl <C-w>l

:nnoremap <leader>jc :e%:p:h<cr>
:nnoremap <leader>jr :e.<cr>

:nnoremap <leader>sf :FZF<cr>
:nnoremap <leader>st :Tags<cr>
:nnoremap <leader>sb :Buffers<cr>
command! -bang -nargs=* AgExact call fzf#vim#ag(<q-args>, '-Q', <bang>0)
command! -bang -nargs=* AgWords call fzf#vim#ag(<q-args>, '-Q -w', <bang>0)
command! -bang -nargs=* AgCs call fzf#vim#ag(<q-args>, '-s', <bang>0)
command! -bang -nargs=* AgCsExact call fzf#vim#ag(<q-args>, '-Q -s', <bang>0)
command! -bang -nargs=* AgCsWords call fzf#vim#ag(<q-args>, '-Q -w -s', <bang>0)
" CTRL-A CTRL-Q to select all and build quickfix list

function! s:build_location_list(lines)
  call setloclist(0, map(copy(a:lines), '{ "filename": v:val }'), 'r', {'title': 'test'})
  lopen
  ll
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_location_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
:nnoremap <leader>sar :Ag<space>
:nnoremap <leader>sae :AgExact<space>
:nnoremap <leader>saw :AgWords<space>
:nnoremap <leader>sase :AgCsExact<space>
:nnoremap <leader>sasw :AgCsWords<space>
:nnoremap <leader>sasr :AgCs<space>

:inoremap jk <esc>
:inoremap <esc> <nop>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
function! SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType python,js,html,less call SetLSPShortcuts()
augroup END
