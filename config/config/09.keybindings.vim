"========== GENERAL ==========
" nnoremap <esc> :let @/=""<cr>
inoremap jk <esc>
inoremap JK <esc>
tnoremap jk <C-\><C-n>
" inoremap Pp <c-r>"
" inoremap PP <c-r>0


inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-\>\<C-O>:call ncm2#manual_trigger()\<CR>"
" inoremap <Tab> <C-n>
" inoremap <silent><expr> <esc> pumvisible() ? "\<C-n>" : "\<C-\>\<C-O>:call ncm2#manual_trigger()\<CR>"

onoremap il :<c-u>normal! _vg_<cr>
vnoremap P "0p
vnoremap il :<c-u>normal! _vg_<cr>
vnoremap <F1> <c-y>
vnoremap <F2> <c-e>
vnoremap <F3> <c-u>
vnoremap <F4> <c-d>
vnoremap <F5> zH
vnoremap <F6> zL

command! W :w

let g:inflector_mapping = 'gI'

" ========== LEADER ==========
let mapleader = " "
let maplocalleader = " "
let g:which_key_map =  {}

let g:which_key_map.v = { 'name' : '☰ NVIM' }
let g:which_key_map.v.e = 'Edit configs'
let g:which_key_map.v.s = 'Source configs'
let g:which_key_map.v.c = 'Cache session'
let g:which_key_map.v.q = 'Quit'
let g:which_key_map.v.Q = 'Quit and make session'
let g:which_key_map.v.r = 'Restore session'
nnoremap <leader>ve :tabnew ~/.config/nvim/config<cr>
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>vc :mksession! .s.vim<cr>
nnoremap <leader>vq :qa<cr>
nnoremap <leader>vQ :mksession! .s.vim<cr>:qa<cr>
nnoremap <leader>vr :source .s.vim<cr>


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
let g:which_key_map.q.C = 'copy loclist to quickfix'
let g:which_key_map.q.n = 'next'
let g:which_key_map.q.o.l = 'loclist'
let g:which_key_map.q.o.q = 'quickfix'
let g:which_key_map.q.p = 'previous'
let g:which_key_map.q.q = 'quit'
let g:which_key_map.q.f = 'Filter lines with substr'
let g:which_key_map.q.e = 'Exclude lines with substr'
let g:which_key_map.q.d = 'populate from git Diff'
nnoremap <silent> <leader>qol  :lopen<CR>
nnoremap <silent> <leader>qoq  :copen<CR>
nnoremap <silent> <leader>qC :call setqflist(getloclist(winnr()))<CR>
nnoremap <silent><expr> <leader>qc IsQuickfixOpen() ? ":cc\<CR>" : ":ll\<CR>"
nnoremap <silent><expr> <leader>qn IsQuickfixOpen() ? ":cnext\<CR>" : ":lnext\<CR>"
nnoremap <silent><expr> <leader>qp IsQuickfixOpen() ? ":cprevious\<CR>" : ":lprevious\<CR>"
nnoremap <silent><expr> <leader>qq IsQuickfixOpen() ? ":cclose\<CR>" : ":lclose\<CR>"

" nnoremap gh <c-w>h
" nnoremap gl <c-w>l
" nnoremap gj <c-w>j
" nnoremap gk <c-w>k
" augroup netrw_mapping
"     autocmd!
"     autocmd filetype netrw call NetrwMapping()
" augroup END
"
" function! NetrwMapping()
"     nnoremap <buffer> gh <c-w>h
"     nnoremap <buffer> gl <c-w>l
"     nnoremap <buffer> gj <c-w>j
"     nnoremap <buffer> gk <c-w>k
" endfunction

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
let g:which_key_map.t.m = 'move'
let g:which_key_map.t.q = 'quit'
let g:which_key_map.t.c = 'open current file in a new tab'
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tm :tabmove<space>
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
let g:which_key_map.s.h = 'history'
let g:which_key_map.s.i = 'from input'
let g:which_key_map.s.r = 'custom Rg opts'
let g:which_key_map.s.r = 'regexp'
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
function VimEscape(str, symbols_to_escape)
    let l:_symbols_to_escape = a:symbols_to_escape
    let l:str = a:str
    " single quote is the exception
    if stridx(l:_symbols_to_escape, "'") != -1
        let l:_symbols_to_escape = substitute(l:_symbols_to_escape, "'", "", "g")
        let l:str = substitute(a:str, "'", "''", "g")
    endif
    return escape(l:str, l:_symbols_to_escape)
endfunction
function InputVimEscapedStr(prompt_str, more_symbols_to_escape)
    let l:input_str = InputStr(a:prompt_str)
    let l:input_str = VimEscape(l:input_str, "#$%".a:more_symbols_to_escape)
    let @i = l:input_str
    return l:input_str
endfunction
function RunRgWithOpts(command_suffix)
    let l:command = 'rg --column --line-number --no-heading --color=always --sort=path ' . a:command_suffix
    let l:fzf_args = [
                \l:command,
                \1,
                \fzf#vim#with_preview({'options': [
                    \'--info=inline',
                    \'--preview-window',
                    \'right:50%',
                    \'--preview',
                    \'bat --color=always --style=header,grid --line-range :300 {}'
                \]}),
                \0]
    return call('fzf#vim#grep', l:fzf_args)
endfunction
function HistAddAndReturn(command_str)
    :call histadd("cmd", a:command_str)
    return a:command_str
endfunction

function s:FilterList(list, str, leave)
    if a:leave
        return filter(a:list, {idx, val -> (stridx(val.text, a:str) > -1 || stridx(bufname(val.bufnr), a:str) > -1)})
    else
        return filter(a:list, {idx, val -> (stridx(val.text, a:str) == -1 && stridx(bufname(val.bufnr), a:str) == -1)})
    endif
endfunction
function FilterQfLocList(str, leave)
  let l:qf_number = len(filter(getwininfo(), 'v:val.quickfix && !v:val.loclist'))
  if l:qf_number == 1
      let l:list = getqflist()
      call setqflist(s:FilterList(l:list, a:str, a:leave))
      return
  endif

  let l:tabnr = tabpagenr()
  let l:lists = filter(getwininfo(), {idx, val -> v:val.quickfix && v:val.loclist && l:tabnr == v:val.tabnr})
  if len(l:lists) == 1
      let l:loclist_number = l:lists[0]['loclist']
      let l:list = getloclist(l:loclist_number)
      call setloclist(l:loclist_number, s:FilterList(l:list, a:str, a:leave))
  endif
endfunction

nnoremap <leader>qf :call InputVimEscapedStr("lines to leave: ", "\"'")<cr>:<c-r>=HistAddAndReturn('call FilterQfLocList("<c-r>i", 1)')<cr><cr>
nnoremap <leader>qe :call InputVimEscapedStr("lines to exclude: ", "\"'")<cr>:<c-r>=HistAddAndReturn('call FilterQfLocList("<c-r>i", 0)')<cr><cr>
nnoremap <leader>qd :call setqflist([], ' ', {'lines' : systemlist('git diff --name-only --cached --diff-filter=AM'), 'efm':'%f'})<cr>:copen<cr>

command! -bang -nargs=+ -complete=dir Rg call RunRgWithOpts(<q-args>)
nnoremap <leader>sw :call InputVimEscapedStr(" words: ", "\"'")<cr>:<c-r>=HistAddAndReturn('Rg "<c-r>i" --no-ignore-vcs -F -w')<cr><cr>
nnoremap <leader>se :call InputVimEscapedStr(" exact: ", "\"'")<cr>:<c-r>=HistAddAndReturn('Rg "<c-r>i" --no-ignore-vcs -F')<cr><cr>
nnoremap <leader>ss :call InputVimEscapedStr("search: ", '"')<cr>:Rg "<c-r>i" --no-ignore-vcs -S <space>
nnoremap <leader>sy /<c-r>=VimEscape(substitute(@0, '\n\+$', '', ''), ".* \\/")<cr>
nnoremap <leader>si /<c-r>=InputVimEscapedStr("input: ", ".* \\/")<cr>
nnoremap <leader>sb :Buffers<cr>
nnoremap <leader>sc :let @/=""<cr>
nnoremap <leader>sf :FZF<cr>
nnoremap <leader>sh :History<cr>
nnoremap <leader>st :Tags<cr>




let g:which_key_map.l = { 'name' : '☰ LANGUAGE' }
let g:which_key_map.l.d = 'go to definition'
let g:which_key_map.l.r = 'rename'
let g:which_key_map.l.i = 'type info'
let g:which_key_map.l.m = { 'name' : '☰ Make' }
let g:which_key_map.l.m.a = 'All'
let g:which_key_map.l.m.q = 'Quick'
let g:which_key_map.l.m.d = 'git Diff'
" ALSO nnoremap gd IS DEFINED LOCALLY FOR BUFFERS
nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>li :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>lma :Neomake<cr>
nnoremap <leader>lmd :call NeomakeGitDiff()<CR>

let g:which_key_map.l.a = { 'name' : '☰ Add' }
let g:which_key_map.l.a.b = 'breakpoint'
let g:which_key_map.l.a.i = 'import'
let g:which_key_map.l.a.w = 'word'
nnoremap <leader>law :SpellingAddWord<cr>

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
nnoremap <leader>lfa :Neoformat<CR>
nnoremap <leader>lfb :!git diff --name-only --diff-filter=MA \| grep '.py' \| xargs black <CR>
nnoremap <leader>lfs :!git diff --name-only --diff-filter=MA \| grep '.py' \| xargs isort <CR>

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
let g:which_key_map.c.t = 'Trim whitespaces'
let g:which_key_map.c.R = 'Refresh buffers & regenerate local tags'
let g:which_key_map.c.T = 'Refresh outer tags'
nnoremap <leader>cf :!cp '%:p' '%:p:h/.%:e'<Left><Left><Left><Left><Left>
nnoremap <silent> <leader>cp :let @0=@%<CR>:let @+=@%<CR>
nnoremap <leader>ccr :call InputVimEscapedStr("new_env: ", '"')<cr>:tabnew<cr>:e /home/pavel/projects/braavo/aprenita/env_requisite/credentials.yml<CR>/current_env<CR>f:wv$hy/## start <C-r>"<cr><Home><C-v>/## end <C-r>"<cr><Home>I# <Esc>/current_env<cr>f:wc$<C-r>i<Esc>/## start <C-r>i<Cr><Home><C-v>/## end <C-r>i<cr><Home>lx:w<cr>:echo '<C-r>i was installed in credentials.yml'<cr>:tabclose<cr>
nnoremap <leader>ccl :call InputVimEscapedStr("new_env: ", '"')<cr>:tabnew<cr>:e /home/pavel/projects/braavo/aprenita/env_requisite/clickhouse_config.yml<CR>/current_env<CR>f:wv$hy/## start <C-r>"<cr><Home><C-v>/## end <C-r>"<cr><Home>I# <Esc>/current_env<cr>f:wc$<C-r>i<Esc>/## start <C-r>i<Cr><Home><C-v>/## end <C-r>i<cr><Home>lx:w<cr>:echo '<C-r>i env was installed in clickhouse_config.yml'<cr>:tabclose<cr>
nnoremap <silent> <leader>ct :%s/\s\+$//g<CR>
nnoremap <leader>cR :syntax off<CR>:let _current_buffer=bufnr("%")<CR>:bufdo execute ":e"<CR>:b <c-r>=_current_buffer<CR><CR>:GutentagsUpdate!<CR>:syntax on<CR>
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
