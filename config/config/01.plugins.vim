call plug#begin('~/.local/share/nvim/plugged')

Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'

Plug 'tpope/vim-fugitive'

Plug 'bling/vim-airline'
Plug 'liuchengxu/space-vim-theme'

Plug 'liuchengxu/vim-which-key'

Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'

Plug 'mileszs/ack.vim'
Plug 'Asheq/close-buffers.vim'

Plug 'stefandtw/quickfix-reflector.vim'

call plug#end()

