set backspace=indent,eol,start
set guifont=Monaco:h14
color desert
set hlsearch incsearch
set number
set nowrap
set signcolumn=yes
set encoding=utf-8
set spellfile=/root/.config/nvim/config/spelling/words.add
" set spell spelllang=en_us
set laststatus=2
set statusline=%F         " Path to the file
set statusline+=%<
set statusline+=%=        " Switch to the right side
set statusline+=%P        " Percentage
set statusline+=\ of\           " Separator
set statusline+=%L        " Total lines
set completeopt=longest,menuone,noselect,noinsert
syntax on
filetype plugin on
