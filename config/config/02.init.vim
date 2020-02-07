set backspace=indent,eol,start
set guifont=Monaco:h14
colorscheme space_vim_theme
set hlsearch incsearch
set number
set nowrap
set smartcase
set ignorecase
set signcolumn=yes
set t_Co=256
set encoding=utf-8
set laststatus=2
set statusline=%F         " Path to the file
set statusline+=%<
set statusline+=%=        " Switch to the right side
set statusline=%F         " Path to the file
set statusline+=%P        " Percentage
set statusline+=\ of\           " Separator
set statusline+=%L        " Total lines
set completeopt=noinsert,menuone,noselect
syntax on
set completeopt=menu,longest
set pumheight=20
set redrawtime=10000
set clipboard=unnamed
let g:netrw_altv = 1
let g:netrw_alto = 1

let g:tagbar_foldlevel = 0
let g:tagbar_autoclose = 1
let g:tagbar_sort = 0

let g:spell_enabled = 0
let g:context_enabled = 0
let g:loaded_sql_completion = 0
set updatetime=100

set termguicolors

" Git Gutter Options

let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_highlight_lines = 1


" Hexokinase
let g:Hexokinase_ftEnabled = []
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_refreshEvents = ['TextChanged', 'InsertLeave']
let g:Hexokinase_optInPatterns = [
\     'full_hex', 'triple_hex', 'colour_names',
\     'rgb', 'rgba', 'hsl', 'hsla',
\ ]
