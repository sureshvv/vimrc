set nocompatible              " required
filetype off                  " required
set acd nows ic
cabbr <expr> %% expand('%:p:h')

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
" Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'ambv/black'
Plugin 'tweekmonster/django-plus.vim'
Plugin 'Glench/Vim-Jinja2-Syntax'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
" nnoremap <space> za
"
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

au BufNewFile,BufRead *.py
    \ set tabstop=4       |
    \ set softtabstop=4   |
    \ set shiftwidth=4    |
    \ set textwidth=79    |
    \ set expandtab       |
    \ set autoindent      |
    \ set fileformat=unix |

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.js, *.html, *.css, *.ts, *.tsx, *.jsx, *.vue
    \ set tabstop=2     |
    \ set softtabstop=2 |
    \ set shiftwidth=2  |
    \ set expandtab     |
    \ set autoindent    |

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set nu

let g:ycm_server_log_level = 'debug'

" let g:pymode = 1
" let g:pymode_options = 1
" let g:pymode_indent = 1
" let g:pymode_motion = 1
" let g:pymode_doc = 1
" let g:pymode_doc_bind = 'K'
" let g:pymode_virtualenv = 1
" let g:pymode_lint = 1
" let g:pymode_lint_on_write = 1
" let g:pymode_lint_message = 1
" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
" let g:pymode_lint_ignore = ["E501", "W",]
" let g:pymode_rope = 1
" let g:pymode_rope_completion = 1
" let g:pymode_rope_complete_on_dot = 1
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype vue setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ts setlocal ts=2 sts=2 sw=2 expandtab

let g:prettier#autoformat_require_pragma = 0
