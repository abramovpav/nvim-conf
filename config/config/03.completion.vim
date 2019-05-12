set completeopt=noinsert,menuone,noselect
let g:LanguageClient_serverCommands = {
	\ 'python': ['/usr/local/bin/pyls'],
\ }
let g:LanguageClient_diagnosticsList = "Location"
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_useVirtualText = 0
let g:LanguageClient_changeThrottle = 3
call deoplete#custom#option('sources', {
	\ '_': ['buffer'],
	\ 'cpp': ['buffer', 'tag'],
	\ 'python': ['buffer', 'tag', 'LanguageClient'],
\})
set formatexpr=LanguageClient_textDocument_rangeFormatting()
