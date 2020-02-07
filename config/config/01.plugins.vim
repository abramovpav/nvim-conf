call plug#begin('~/.local/share/nvim/plugged')

Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'

" :Gblame
Plug 'tpope/vim-fugitive'

Plug 'bling/vim-airline'
Plug 'liuchengxu/space-vim-theme'
Plug 'liuchengxu/vim-which-key'
Plug 'sheerun/vim-polyglot'

Plug 'Asheq/close-buffers.vim'
Plug 'stefandtw/quickfix-reflector.vim'

Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'wellle/context.vim'
Plug 'airblade/vim-gitgutter'
Plug 'thaerkh/vim-indentguides'
Plug 'rrethy/vim-hexokinase', {
    \ 'do': 'docker run -v $(pwd):/mnt -w /mnt golang:1.13 make hexokinase'
    \ }
Plug 'wakatime/vim-wakatime'
Plug 'jiangmiao/auto-pairs'

call plug#end()

