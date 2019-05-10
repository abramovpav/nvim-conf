set backspace=indent,eol,start
set guifont=Monaco:h14
set hlsearch incsearch
set number
set nowrap
set laststatus=2
set statusline=%F         " Path to the file
set statusline+=%<
set statusline+=%=        " Switch to the right side
set statusline+=%P        " Percentage
set statusline+=\ of\           " Separator
set statusline+=%L        " Total lines
set statusline+=%{gutentags#statusline()}
set completeopt=longest,menuone,noselect,noinsert
:syntax on
