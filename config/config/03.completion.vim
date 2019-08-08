let g:ale_fixers = {
			\ 'python': ['black', 'isort'],
			\ }
let g:ale_linters = {
			\ 'python': ['pyls', 'spell_check'],
			\ }
let g:ale_python_pyls_config = {
   \ 'pyls':  {
   \     'plugins': {
   \         'pycodestyle': {'enabled': v:false},
   \         'mccabe': {'enabled': v:false},
   \         'pyflakes': {'enabled': v:false},
   \         'pylint': {'enabled': v:true}
   \     }
   \ }
   \}
let g:ale_completion_enabled = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
" let g:ale_lint_on_save = 0
let g:ale_sign_error = '◆'
let g:ale_sign_warning = '▲'
let g:ale_sign_info = '●'
highlight ALEErrorSign ctermfg=red
highlight ALEWarningSign ctermfg=yellow
highlight ALEInfoSign ctermfg=blue
