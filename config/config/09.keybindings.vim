

" ========== GENERAL ==========
inoremap <esc> <nop>
inoremap jk <esc>
" tnoremap <Esc> <C-\><C-n>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-\>\<C-O>:call ncm2#manual_trigger()\<CR>"
inoremap § <Tab>

onoremap il :<c-u>normal! _vg_<cr>
vnoremap P "0p
vnoremap il :<c-u>normal! _vg_<cr>


" ========== LEADER ==========
let mapleader = " "
let maplocalleader = " "
let g:which_key_map =  {}

let g:which_key_map.v = { 'name' : '☰ NVIM CONFIG' }
let g:which_key_map.v.e = 'edit'
let g:which_key_map.v.s = 'source'
nnoremap <leader>ve :tabnew ~/.config/nvim/config<cr>
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>


let g:which_key_map.m = {'name': '☰ Mode'}
let g:which_key_map.m.s = 'spell'
let g:which_key_map.m.t = 'tabbar toggle'
nnoremap <leader>ms :call SpellToggle()<cr>
nnoremap <leader>mt :TagbarToggle<CR>


function IsQuickfixOpen()
  return len(filter(getwininfo(), 'v:val.quickfix && !v:val.loclist'))
endfunction

let g:which_key_map.q = { 'name' : '☰ QUICKFIX / LOCLIST' }
let g:which_key_map.q.o = {'name': '☰ Open'}
let g:which_key_map.q.c = 'current'
let g:which_key_map.q.n = 'next'
let g:which_key_map.q.o.l = 'loclist'
let g:which_key_map.q.o.q = 'quickfix'
let g:which_key_map.q.p = 'previous'
let g:which_key_map.q.q = 'quit'
nnoremap <silent> <leader>qol  :lopen<CR>
nnoremap <silent> <leader>qoq  :copen<CR>
nnoremap <silent><expr> <leader>qc IsQuickfixOpen() ? ":cc\<CR>" : ":ll\<CR>"
nnoremap <silent><expr> <leader>qn IsQuickfixOpen() ? ":cnext\<CR>" : ":lnext\<CR>"
nnoremap <silent><expr> <leader>qp IsQuickfixOpen() ? ":cprevious\<CR>" : ":lprevious\<CR>"
nnoremap <silent><expr> <leader>qq IsQuickfixOpen() ? ":cclose\<CR>" : ":lclose\<CR>"

let g:which_key_map.w = { 'name' : '☰ WINDOW' }
let g:which_key_map.w.h = 'switch to left'
let g:which_key_map.w.j = 'switch to down'
let g:which_key_map.w.k = 'switch to up'
let g:which_key_map.w.l = 'switch to right'
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

let g:which_key_map.t = { 'name' : '☰ TAB' }
let g:which_key_map.t.n = 'new'
let g:which_key_map.t.q = 'quit'
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tq :tabclose<CR>

let g:which_key_map.j = { 'name' : '☰ JUMP' }
let g:which_key_map.j.c = 'current buffer dir'
let g:which_key_map.j.r = 'pwd'
nnoremap <leader>jc :e%:p:h<cr>
nnoremap <leader>jr :e.<cr>

let g:which_key_map.s = { 'name' : '☰ SEARCH' }
let g:which_key_map.s.b = 'buffers'
let g:which_key_map.s.c = 'clear'
let g:which_key_map.s.e = 'exact'
let g:which_key_map.s.f = 'files'
let g:which_key_map.s.r = 'regexp'
let g:which_key_map.s.t = 'tags'
let g:which_key_map.s.w = 'exact words'
let g:which_key_map.s.y = 'yanked'
nnoremap <leader>sb :Buffers<cr>
nnoremap <leader>sc :let @/=""<cr>
nnoremap <leader>se :RgRaw<space>--no-ignore-vcs<space>-F<space>''<left>
nnoremap <leader>sf :FZF<cr>
nnoremap <leader>sr :RgRaw<space>--no-ignore-vcs<space>
nnoremap <leader>st :Tags<cr>
nnoremap <leader>sw :RgRaw<space>--no-ignore-vcs<space>-F<space>-w<space>''<left>
nnoremap <leader>sy /<C-r>"<cr>


let g:which_key_map.l = { 'name' : '☰ LANGUAGE' }
let g:which_key_map.l.a = 'add word'
let g:which_key_map.l.d = 'go to definition'
let g:which_key_map.l.m = 'make'
nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lm :Neomake<CR>

let g:which_key_map.l.a = { 'name' : '☰ Add' }
let g:which_key_map.l.a.b = 'breakpoint'
let g:which_key_map.l.a.i = 'import'
let g:which_key_map.l.a.w = 'word'
nnoremap <leader>law "ryiw:silent !spelling -a <C-r>r
vnoremap <leader>law "ry:silent !spelling -a <C-r>r

let g:which_key_map.l.t = { 'name' : '☰ Toggle' }
let g:which_key_map.l.t.c = 'toggle context'
let g:which_key_map.l.t.s = 'toggle spelling'
nnoremap <leader>ltc :ContextToggle<CR>
nnoremap <leader>lts :SpellingToggle<CR>

let g:which_key_map.l.f = { 'name': '☰ Fix' }
let g:which_key_map.l.f.a = 'all format'
let g:which_key_map.l.f.f = 'format'
let g:which_key_map.l.f.i = 'imports'
nnoremap <leader>lfa :Neoformat<CR>

let g:which_key_map.l.o = { 'name': '☰ Optimize' }
let g:which_key_map.l.o.i = 'imports'

let g:which_key_map.l.s = { 'name': '☰ Spelling' }
let g:which_key_map.l.s.a = 'Add word'
nnoremap <leader>lsa :SpellingAddWord<CR>

let g:which_key_map.b = {'name': '☰ BUFFERS'}
nnoremap <silent> <leader>bq :CloseHiddenBuffers<CR>
let g:which_key_map.b.q = 'quit all'

let g:which_key_map.c = {'name': '☰ COMMANDS'}
let g:which_key_map.c.f = 'copy file'
let g:which_key_map.c.p = 'copy file path'
nnoremap <leader>cf :!cp '%:p' '%:p:h/.%:e'<Left><Left><Left><Left><Left>
nnoremap <silent> <leader>cp :let @0=@%<CR>:let @+=@%<CR>


call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

