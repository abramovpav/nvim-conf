autocmd ColorScheme * highlight SpellBad cterm=underline gui=underline ctermfg=243 guifg=#727272
set backspace=indent,eol,start
colorscheme space_vim_theme
set hlsearch incsearch
set relativenumber

set nowrap
set smartcase
set ignorecase

set number
set splitright
set splitbelow

set signcolumn=yes:1
set encoding=utf-8
set laststatus=2
set statusline=%F         " Path to the file
set statusline+=%<
set statusline+=%=        " Switch to the right side
set statusline=%F         " Path to the file
set statusline+=%P        " Percentage
set statusline+=\ of\     " Separator
set statusline+=%L        " Total lines
set completeopt=noinsert,menuone,noselect
syntax on
set completeopt=menu,longest
set pumheight=20
set redrawtime=10000
set clipboard=unnamedplus
let g:netrw_altv = 1
let g:netrw_alto = 1

set exrc
set secure
let g:tagbar_foldlevel = 0
let g:tagbar_autoclose = 1
let g:tagbar_sort = 0

let g:context_enabled = 0
let g:context_presenter = 'preview'
let g:loaded_sql_completion = 0
set updatetime=100

set termguicolors
" let g:python_highlight_func_calls = 0

" Git Gutter Options

let g:gitgutter_highlight_linenrs = 1
" let g:gitgutter_highlight_lines = 1


" Hexokinase
let g:Hexokinase_ftEnabled = ['less', 'css', 'svg', 'html']
let g:Hexokinase_highlighters = ['backgroundfull']
" let g:Hexokinase_refreshEvents = ['TextChanged', 'InsertLeave']
let g:Hexokinase_optInPatterns = [
\     'full_hex', 'triple_hex', 'colour_names',
\     'rgb', 'rgba', 'hsl', 'hsla',
\ ]

function! RemoveTrailingWhitespaces()
    let search = @/
    let view = winsaveview()
    silent! %s/\s\+$//e
    let @/=search
    call winrestview(view)
endfunction
autocmd! BufWritePre * call RemoveTrailingWhitespaces()
let g:qf_modifiable = 1
let g:qf_join_changes = 1
let g:qf_write_changes = 0
