call plug#begin('~/.local/share/nvim/plugged')

Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'

Plug 'liuchengxu/space-vim-theme'

Plug 'liuchengxu/vim-which-key'
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

