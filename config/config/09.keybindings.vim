
" ========== GENERAL ==========
inoremap <esc> <nop>
inoremap jk <esc>
inoremap JK <esc>
" tnoremap <Esc> <C-\><C-n>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-\>\<C-O>:call ncm2#manual_trigger()\<CR>"

onoremap il :<c-u>normal! _vg_<cr>
vnoremap P "0p
vnoremap il :<c-u>normal! _vg_<cr>
" inoremap <c-1> <tab>


command! W :w


" ========== LEADER ==========
let mapleader = " "
let maplocalleader = " "
let g:which_key_map =  {}

let g:which_key_map.v = { 'name' : '☰ NVIM CONFIG' }
let g:which_key_map.v.e = 'edit'
let g:which_key_map.v.s = 'source'
nnoremap <leader>ve :tabnew ~/.config/nvim/config<cr>
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>


let g:which_key_map.m = {'name': '☰ MODE'}
let g:which_key_map.m.s = 'spell'
let g:which_key_map.m.t = 'tabbar toggle'
nnoremap <leader>ms :call SpellingToggle()<cr>
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
let g:which_key_map.w.s = { 'name': '☰ Split size managent' }
let g:which_key_map.w.s.l = 'Increase horizontally +5'
let g:which_key_map.w.s.h = 'Increase vertically +5'
let g:which_key_map.w.s.j = 'Decrease vertically -5'
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <silent> <leader>wsl :vertical resize +5<CR>
nnoremap <silent> <leader>wsh :vertical resize -5<CR>
nnoremap <silent> <leader>wsk :resize +5<CR>
nnoremap <silent> <leader>wsj :resize -5<CR>
nnoremap <silent> <leader>wse <C-w>=

let g:which_key_map.t = { 'name' : '☰ TAB' }
let g:which_key_map.t.n = 'new'
let g:which_key_map.t.q = 'quit'
let g:which_key_map.t.c = 'open current file in a new tab'
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tq :tabclose<CR>
nnoremap <leader>tc :tabnew %<CR>

let g:which_key_map.j = { 'name' : '☰ JUMP' }
let g:which_key_map.j.c = 'current buffer dir'
let g:which_key_map.j.n = 'open notes'
let g:which_key_map.j.r = 'pwd'
nnoremap <leader>jc :e%:p:h<cr>
nnoremap <leader>jn :tabnew .notes<CR>
nnoremap <leader>jr :e.<cr>

let g:which_key_map.s = { 'name' : '☰ SEARCH' }
let g:which_key_map.s.b = 'buffers'
let g:which_key_map.s.c = 'clear'
let g:which_key_map.s.e = 'exact'
let g:which_key_map.s.f = 'files'
let g:which_key_map.s.r = 'regexp'
let g:which_key_map.s.r = 'custom Rg opts'
let g:which_key_map.s.t = 'tags'
let g:which_key_map.s.w = 'exact words'
let g:which_key_map.s.y = 'yanked'

function InputStr(prompt_str)
    call inputsave()
    let l:input_str =input(a:prompt_str)
    call inputrestore()
    let @i = l:input_str
    return l:input_str
endfunction
function InputVimEscapedStr(prompt_str, more_symbols_to_escape)
    let l:input_str = InputStr(a:prompt_str)
    let l:symbols_to_escape = a:more_symbols_to_escape
    " single quote is the exception
    if stridx(l:symbols_to_escape, "'") != -1
        let l:symbols_to_escape = substitute(l:symbols_to_escape, "'", "", "g")
        let l:input_str = substitute(l:input_str, "'", "''", "g")
    endif
    let l:input_str = escape(l:input_str, '#$%'.l:symbols_to_escape)
    let @i = l:input_str
    return l:input_str
endfunction
function RunRgWithOpts(command_suffix)
    let l:command = 'rg --column --line-number --no-heading --color=always --sort=path ' . a:command_suffix
    let l:fzf_args = [
                \l:command,
                \1,
                \fzf#vim#with_preview(
                    \'right:40%',
                    \'ctrl-p'
                \),
                \0]
    return call('fzf#vim#grep', l:fzf_args)
endfunction
function HistAddAndReturn(command_str)
    :call histadd("cmd", a:command_str)
    return a:command_str
endfunction

command! -bang -nargs=+ -complete=dir Rg call RunRgWithOpts(<q-args>)
nnoremap <leader>sw :call InputVimEscapedStr(" words: ", "\"'")<cr>:<c-r>=HistAddAndReturn('Rg "<c-r>i" --no-ignore-vcs -F -w')<cr><cr>
nnoremap <leader>se :call InputVimEscapedStr(" exact: ", "\"'")<cr>:<c-r>=HistAddAndReturn('Rg "<c-r>i" --no-ignore-vcs -F')<cr><cr>
nnoremap <leader>ss :call InputVimEscapedStr("search: ", '"')<cr>:Rg "<c-r>i" --no-ignore-vcs<space>
nnoremap <leader>sb :Buffers<cr>
nnoremap <leader>sc :let @/=""<cr>
nnoremap <leader>sf :FZF<cr>
nnoremap <leader>st :Tags<cr>
nnoremap <leader>sy /<C-r>"<cr>




let g:which_key_map.l = { 'name' : '☰ LANGUAGE' }
let g:which_key_map.l.a = 'add word'
let g:which_key_map.l.d = 'go to definition'
let g:which_key_map.l.m = 'make'
let g:which_key_map.l.r = 'rename'
let g:which_key_map.l.i = 'type info'
let g:which_key_map.l.o = { 'name': 'optimize' }
let g:which_key_map.l.o.i = 'imports'

" ALSO nnoremap gd IS DEFINED LOCALLY FOR BUFFERS
nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lm :Neomake<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>li :call LanguageClient#textDocument_hover()<CR>

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
let g:which_key_map.l.f.b = 'all black'
let g:which_key_map.l.f.s = 'all isort'
nnoremap <leader>lfb :!git diff --name-only --diff-filter=MA \| grep '.py' \| xargs black <CR>
nnoremap <leader>lfs :!git diff --name-only --diff-filter=MA \| grep '.py' \| xargs isort <CR>
nnoremap <leader>lfa :Neoformat<CR>

let g:which_key_map.l.o = { 'name': '☰ Optimize' }
let g:which_key_map.l.o.i = 'imports'

let g:which_key_map.l.s = { 'name': '☰ Spelling' }
let g:which_key_map.l.s.a = 'Add word'
nnoremap <leader>lsa :SpellingAddWord<CR>

let g:which_key_map.b = {'name': '☰ BUFFERS'}
nnoremap <silent> <leader>bq :Bdelete hidden<CR>
let g:which_key_map.b.q = 'quit all'

let g:which_key_map.c = {'name': '☰ COMMANDS'}
let g:which_key_map.c.f = 'copy file'
let g:which_key_map.c.p = 'copy file path'
let g:which_key_map.c.c = {'name': 'set settings'}
let g:which_key_map.c.c.r = 'credentials'
let g:which_key_map.c.c.l = 'clickhouse_config'
let g:which_key_map.c.R = 'Refresh buffers & regenerate local tags'
let g:which_key_map.c.T = 'Refresh outer tags'
nnoremap <leader>cf :!cp '%:p' '%:p:h/.%:e'<Left><Left><Left><Left><Left>
nnoremap <silent> <leader>cp :let @0=@%<CR>:let @+=@%<CR>
nnoremap <leader>ccr :call InputVimEscapedStr("new_env: ", '"')<cr>:tabnew<cr>:e /home/pavel/projects/braavo/aprenita/env_requisite/credentials.yml<CR>/current_env<CR>f:wv$hy/## start <C-r>"<cr><Home><C-v>/## end <C-r>"<cr><Home>I# <Esc>/current_env<cr>f:wc$<C-r>i<Esc>/## start <C-r>i<Cr><Home><C-v>/## end <C-r>i<cr><Home>lx:w<cr>:echo '<C-r>i was installed in credentials.yml'<cr>:tabclose<cr>
nnoremap <leader>ccl :call InputVimEscapedStr("new_env: ", '"')<cr>:tabnew<cr>:e /home/pavel/projects/braavo/aprenita/env_requisite/clickhouse_config.yml<CR>/current_env<CR>f:wv$hy/## start <C-r>"<cr><Home><C-v>/## end <C-r>"<cr><Home>I# <Esc>/current_env<cr>f:wc$<C-r>i<Esc>/## start <C-r>i<Cr><Home><C-v>/## end <C-r>i<cr><Home>lx:w<cr>:echo '<C-r>i env was installed in clickhouse_config.yml'<cr>:tabclose<cr>
nnoremap <leader>cR :syntax off<CR>:let _current_buffer=bufnr("%")<CR>:bufdo execute ":e"<CR>:b <c-r>=_current_buffer<CR><CR>:GutentagsUpdate!<CR>:syntax on<CR>
nnoremap <leader>cf :!cp '%:p' '%:p:h/.%:e'<Left><Left><Left><Left><Left>
nnoremap <leader>cT :call GenerateSitePackageTags()<CR>

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>



" ========== Terminal ==========
" https://github.com/junegunn/fzf.vim/issues/544
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<C-\><C-n>"

" ========== GitGutter ==========
" https://github.com/airblade/vim-gitgutter
let g:which_key_map.g = {'name': '☰ GIT'}
let g:which_key_map.g.n = 'next hunk'
let g:which_key_map.g.p = 'prev hunk'
let g:which_key_map.g.u = 'undo hunk'
let g:which_key_map.g.v = 'preview hunk'
let g:which_key_map.g.d = 'show diff'
let g:which_key_map.g.m = 'merge tool'
nnoremap <leader>gn :GitGutterNextHunk<cr>
nnoremap <leader>gp :GitGutterPrevHunk<cr>
nnoremap <leader>gu :GitGutterUndoHunk<cr>
nnoremap <leader>gv :GitGutterPreviewHunk<cr>
nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gm :Git mergetool<cr>

" debug
let g:which_key_map.d = {'name': '☰ DEBUG'}
let g:which_key_map.d.a = 'add breakpoint'
let g:which_key_map.d.d = 'delete breakpoint'
let g:which_key_map.d.D = 'delete breakpoint in buffer'
let g:which_key_map.d.C = 'delete all breakpoints'
let g:which_key_map.d.l = 'show breakpoint'
let g:which_key_map.d.c = 'copy breakpoint'
let g:which_key_map.d.R = 'run script'
let g:which_key_map.d.r = 'run django script'
let g:which_key_map.d.s = 'run django server'
nnoremap <silent><leader>da :call AddBreakpoint()<cr>
nnoremap <silent><leader>dd :call DeleteBreakpoint()<cr>
nnoremap <silent><leader>dD :call DeleteBufferBreakpoints()<cr>
nnoremap <silent><leader>dC :call DeleteAllBreakpoints()<cr>
nnoremap <silent><leader>dl :call ShowBreakpoints()<cr>
nnoremap <silent><leader>dc :silent let @* = PDBGetBreakpoint(v:null, v:null)<cr>
nnoremap <silent><leader>dR :PDBRunDockerScript<cr>i
nnoremap <silent><leader>dr :PDBRunDockerDjangoScript<cr>i
nnoremap <silent><leader>ds :PDBRunDockerDjangoServer tabnew<cr>gT
