let g:ale_linters = {
			\ 'python': ['pyls', 'spell_check'],
			\ }
let g:ale_sign_error = '◆'
let g:ale_sign_warning = '▲'
let g:ale_sign_info = '●'
highlight ALEErrorSign ctermfg=red
highlight ALEWarningSign ctermfg=yellow
highlight ALEInfoSign ctermfg=blue


let g:ncm2#auto_popup = 0
let g:ncm2#total_popup_limit = 15
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ }

let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_python = ['black', 'isort']
let g:neomake_python_enabled_makers = ['flake8', 'pylint', 'spelling']
let g:neomake_open_list = 1
let g:neomake_virtualtext_current_error = 0
let g:neomake_highlight_lines = 0
let g:neomake_highlight_columns = 0
let g:neomake_spelling_maker = {
	\ 'exe': 'spelling',
	\ 'args': ['%t'],
	\ 'errorformat': '%f:%l:%c:%m',
	\ }
:call neomake#cmd#disable(g:)
