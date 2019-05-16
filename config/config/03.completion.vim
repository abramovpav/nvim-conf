let g:ale_fixers = {
			\ 'python': ['black', 'isort'],
			\ }
let g:ale_linters = {
			\ 'python': ['pyls'],
			\ }
let g:ale_python_pyls_config = {
			\ 'pyls':  {
			\     'plugins': {
			\         'pyflakes': {'enabled': v:false},
			\         'pylint': {'enabled': v:true}
			\     }
			\ }
			\}
let g:ale_completion_enabled = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
