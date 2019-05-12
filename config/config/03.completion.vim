set completeopt=noinsert,menuone,noselect
let g:LanguageClient_serverCommands = {
	\ 'python': ['/usr/local/bin/pyls'],
\ }
call LanguageClient#setDiagnosticsList('Disabled')
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
	\ '_': ['buffer'],
	\ 'cpp': ['buffer', 'tag'],
	\ 'python': ['buffer', 'tag', 'LanguageClient'],
\})
set formatexpr=LanguageClient_textDocument_rangeFormatting()
