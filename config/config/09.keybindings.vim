:let mapleader = " "
let g:which_key_map =  {}

:inoremap jk <esc>
:inoremap <esc> <nop>
:tnoremap <Esc> <C-\><C-n>

:vnoremap P "0p
let g:which_key_map.r = { 'name' : '☰ Replace' }
:vnoremap <leader>ry "ry:%s/<C-r>r/<C-r>0/gc<CR>
let g:which_key_map.r.y = 'with yanked'

let g:which_key_map.v = { 'name' : '☰ Nvim config' }
:nnoremap <leader>ve :vsplit ~/.config/nvim/config<cr>
let g:which_key_map.v.e = 'edit'
:nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>
let g:which_key_map.v.s = 'source'

let g:which_key_map.m = {'name': '☰ Mode'}
let g:which_key_map.m.c = {'name': '☰ Copy'}
:nnoremap <leader>mco :tab split<CR>:setlocal nonumber<CR>:setlocal signcolumn=no<CR> 
let g:which_key_map.m.c.o = 'open'
:nnoremap <leader>mcc :tabclose<CR>
let g:which_key_map.m.c.c = 'close'
:nnoremap <leader>mt :TagbarToggle<CR>
let g:which_key_map.m.t = 'tabbar toggle'
:nnoremap <leader>ms :call SpellToggle()<cr>
let g:which_key_map.m.s = 'spell'

:function IsQuickfixOpen()
:  return len(filter(getwininfo(), 'v:val.quickfix && !v:val.loclist'))
:endfunction

let g:which_key_map.q = { 'name' : '☰ Quickfix / Loclist' }
let g:which_key_map.q.o = {'name': '☰ Open'}
let g:which_key_map.q.o.q = 'quickfix'
nnoremap <silent> <leader>qoq  :copen<CR>
let g:which_key_map.q.o.l = 'loclist'
nnoremap <silent> <leader>qol  :lopen<CR>
let g:which_key_map.q.c = 'close'
nnoremap <silent><expr> <leader>qC IsQuickfixOpen() ? ":cclose\<CR>" : ":lclose\<CR>"
let g:which_key_map.q.n = 'next'
nnoremap <silent><expr> <leader>qn IsQuickfixOpen() ? ":cnext\<CR>" : ":lnext\<CR>"
let g:which_key_map.q.c = 'current'
nnoremap <silent><expr> <leader>qc IsQuickfixOpen() ? ":cc\<CR>" : ":ll\<CR>"
let g:which_key_map.q.p = 'previous'
nnoremap <silent><expr> <leader>qp IsQuickfixOpen() ? ":cprevious\<CR>" : ":lprevious\<CR>"


let g:which_key_map.w = { 'name' : '☰ Window' }
:nnoremap <leader>wh <C-w>h
let g:which_key_map.w.h = 'switch to left'
:nnoremap <leader>wj <C-w>j
let g:which_key_map.w.j = 'switch to down'
:nnoremap <leader>wk <C-w>k
let g:which_key_map.w.k = 'switch to up'
:nnoremap <leader>wl <C-w>l
let g:which_key_map.w.l = 'switch to right'


let g:which_key_map.t = { 'name' : '☰ Tab' }
:nnoremap <leader>tn :tabnew<CR>
let g:which_key_map.t.n = 'new'
:nnoremap <leader>tc :tabclose<CR>
let g:which_key_map.t.c = 'close'

let g:which_key_map.j = { 'name' : '☰ Jump' }
:nnoremap <leader>jc :e%:p:h<cr>
let g:which_key_map.j.c = 'current buffer dir'
:nnoremap <leader>jr :e.<cr>
let g:which_key_map.j.r = 'pwd'


let g:which_key_map.s = { 'name' : '☰ search' }
:nnoremap <leader>sc :let @/=""<cr>
let g:which_key_map.s.c = 'clear'
:nnoremap <leader>sf :FZF<cr>
let g:which_key_map.s.f = 'files'
:nnoremap <leader>st :Tags<cr>
let g:which_key_map.s.t = 'tags'
:nnoremap <leader>sb :Buffers<cr>
let g:which_key_map.s.b = 'buffers'
:nnoremap <leader>sy /<C-r>"<cr>
let g:which_key_map.s.y = 'yanked'

let g:which_key_map.s.a = { 'name' : '☰ Ag' }
:nnoremap <leader>sar :AgRaw<space>
let g:which_key_map.s.a.r = 'regexp'
:nnoremap <leader>sae :AgRaw<space>-Q<space>''<left>
let g:which_key_map.s.a.e = 'exact'
:nnoremap <leader>saw :AgRaw<space>-Q<space>-w<space>''<left>
let g:which_key_map.s.a.w = 'exact words'

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-\>\<C-O>:call ncm2#manual_trigger()\<CR>"
inoremap § <Tab>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"


let g:which_key_map.l = { 'name' : '☰ Language' }
:nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
let g:which_key_map.l.d = 'go to definition'
:nnoremap <leader>lf :Neoformat<CR>
let g:which_key_map.l.f = 'fix formatting'
:nnoremap <leader>ll :Neomake<CR>
let g:which_key_map.l.l = 'lint'
:nnoremap <leader>la "ryiw:silent !spelling -a <C-r>r
:vnoremap <leader>la "ry:silent !spelling -a <C-r>r
let g:which_key_map.l.a = 'add word'


let g:which_key_map.b = {'name': '☰ Buffers'}
:nnoremap <silent> <leader>bq :CloseHiddenBuffers<CR>
let g:which_key_map.b.q = 'quit all'

let g:which_key_map.c = {'name': '☰ Commands'}
:nnoremap <leader>cf :!cp '%:p' '%:p:h/.%:e'<Left><Left><Left><Left><Left>
let g:which_key_map.c.f = 'copy file'


call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

