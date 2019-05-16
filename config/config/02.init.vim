set backspace=indent,eol,start
set guifont=Monaco:h14
colorscheme space_vim_theme
set hlsearch incsearch
set number
set nowrap
set signcolumn=auto:2
set t_Co=256
set encoding=utf-8
"set spellfile=/root/.config/nvim/config/spelling/words.add
"set spell spelllang=en_us
set laststatus=2
set statusline=%F         " Path to the file
set statusline+=%<
set statusline+=%=        " Switch to the right side
set statusline+=%P        " Percentage
set statusline+=\ of\           " Separator
set statusline+=%L        " Total lines
set completeopt=longest,menuone,noselect,noinsert
syntax on
set completeopt=menu,longest
set pumheight=20

let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_alto = 1

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_section_a = ''
