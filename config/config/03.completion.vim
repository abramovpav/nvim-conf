let g:ncm2#auto_popup = 0
let g:ncm2#total_popup_limit = 15
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rls'],
    \ }

let g:LanguageClient_rootMarkers = {
\ 'css': ['braavo.html'],
\ 'less': ['braavo.html'],
\ }

if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
"  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif

"if executable('css-languageserver')
"  let g:LanguageClient_serverCommands.less = ['css-languageserver', '--stdio']
"  let g:LanguageClient_serverCommands.css = ['css-languageserver', '--stdio']
""  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
"else
"  echo "css-languageserver not installed!\n"
"  :cq
"endif

let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_python = ['isort', 'black']
let g:neomake_python_enabled_makers = ['flake8', 'pylint']
let g:neomake_open_list = 2
let g:neomake_virtualtext_current_error = 0
let g:neomake_highlight_lines = 0
let g:neomake_highlight_columns = 0
let g:neomake_spelling_maker = {
	\ 'exe': 'spelling',
	\ 'args': ['%t'],
	\ 'errorformat': '%f:%l:%c:%m',
	\ }
:call neomake#cmd#disable(g:)

let g:gutentags_project_root = ['src']
let g:gutentags_ctags_exclude = [
    \  '.git', '.mypy_cache', '.ipynb_checkpoints', '__pycache__',
    \  '*.min.{js,css}',
    \ ]
let g:gutentags_generate_on_new = 0
let g:gutentags_generate_on_missing = 0

function! RefreshSitePackageTags()
    let l:text =<< trim END
    import sys
    bad_endings = (".zip", "dynload")
    for path in sys.path:
        if path and any(path.endswith(ending) for ending in bad_endings):
            continue
        print(path)
    END
    let l:sitepackages = systemlist('python -', l:text)
    for path in l:sitepackages
        if stridx(&tags, path) == -1
            let &tags = &tags.path."/tags,"
        endif
    endfor
    return l:sitepackages
endfunction
autocmd FileType python :call RefreshSitePackageTags()

function! GenerateSitePackageTags()
    let l:sitepackages = RefreshSitePackageTags()
    for path in l:sitepackages
        call system("bash -s", "pushd ".path." && rm -f tags && ctags -R --languages=python --exclude=site-packages --exclude=test && sed -i '/\/\^ /d' tags && popd")
    endfor
endfunction
