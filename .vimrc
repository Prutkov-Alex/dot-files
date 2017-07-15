execute pathogen#infect()
syntax on
filetype plugin indent on

set hidden
set number
set relativenumber
set t_Co=256
set encoding=utf-8
set tabstop=4
set tabstop=4
set shiftwidth=4
set noexpandtab
set smarttab

let python_highlight_all=1

set background=dark
colorscheme solarized

nnoremap <C-g> :NERDTreeToggle<CR>
nnoremap <F3> :SyntasticCheck<CR>
nnoremap <F4> :Autoformat<CR>

""""" Powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

""""" Syntastic settings
let g:syntastic_cpp_compiler_options = ' -std=c++14'
let g:syntastic_python_checkers = ['flake8']
