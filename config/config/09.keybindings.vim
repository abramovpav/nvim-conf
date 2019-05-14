:let mapleader = " "
let g:which_key_map =  {}

:inoremap jk <esc>
:inoremap <esc> <nop>


let g:which_key_map.v = { 'name' : '+Nvim config' }
:nnoremap <leader>ve :vsplit ~/.config/nvim/config<cr>
let g:which_key_map.v.e = 'edit'
:nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>
let g:which_key_map.v.s = 'source'

let g:which_key_map.o = { 'name' : '+Open' }
nnoremap <silent> <leader>oq  :copen<CR>
let g:which_key_map.o.q = 'quickfix'
nnoremap <silent> <leader>ol  :lopen<CR>
let g:which_key_map.o.l = 'loclist'

let g:which_key_map.w = { 'name' : '+Window' }
:nnoremap <leader>wh <C-w>h
let g:which_key_map.w.h = 'switch to left'
:nnoremap <leader>wj <C-w>j
let g:which_key_map.w.j = 'switch to down'
:nnoremap <leader>wk <C-w>k
let g:which_key_map.w.k = 'switch to up'
:nnoremap <leader>wl <C-w>l
let g:which_key_map.w.l = 'switch to right'

let g:which_key_map.j = { 'name' : '+Jump' }
:nnoremap <leader>jc :e%:p:h<cr>
let g:which_key_map.j.c = 'current buffer dir'
:nnoremap <leader>jr :e.<cr>
let g:which_key_map.j.r = 'pwd'


let g:which_key_map.s = { 'name' : '+search' }
:nnoremap <leader>sc :let @/=""<cr>
let g:which_key_map.s.c = 'clear'
:nnoremap <leader>sf :FZF<cr>
let g:which_key_map.s.f = 'files'
:nnoremap <leader>st :Tags<cr>
let g:which_key_map.s.t = 'tags'
:nnoremap <leader>sb :Buffers<cr>
let g:which_key_map.s.b = 'buffers'

let g:which_key_map.s.a = { 'name' : '+Ag' }
:nnoremap <leader>sar :Ag<space>
let g:which_key_map.s.a.r = 'regexp'
:nnoremap <leader>sae :AgExact<space>
let g:which_key_map.s.a.e = 'exact'
:nnoremap <leader>saw :AgWords<space>
let g:which_key_map.s.a.w = 'exact words'
let g:which_key_map.s.a.s = { 'name' : '+Sensitive' }
:nnoremap <leader>sasr :AgCs<space>
let g:which_key_map.s.a.s.r = 'regex'
:nnoremap <leader>sase :AgCsExact<space>
let g:which_key_map.s.a.s.e = 'exact'
:nnoremap <leader>sasw :AgCsWords<space>
let g:which_key_map.s.a.s.w = 'exact words'


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" function! SetLSPShortcuts()
"   nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
"   nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
"   nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
"   nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
"   nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
"   nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
"   nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
"   nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
"   nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
"   nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
" endfunction()
" 
" augroup LSP
"   autocmd!
"   autocmd FileType python,js,html,less call SetLSPShortcuts()
" augroup END

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
