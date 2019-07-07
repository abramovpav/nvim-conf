let g:ale_fixers = {
			\ 'python': ['black', 'isort'],
			\ }
let g:ale_linters = {
			\ 'python': ['pyls'],
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
