" Install Vim plugins with vim-plug
" Vim plugins manager.
" https://github.com/junegunn/vim-plug
call plug#begin()

" Syntax highlighting for HashiCorp Configuration Language (HCL)
Plug 'jvirtanen/vim-hcl'

" File system explorer in vim.
Plug 'preservim/nerdtree'

" Add NerdTree shortcut
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Vim status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Enable powerline-fonts
let g:airline_powerline_fonts = 1

" Initialize plugin system
call plug#end()

" Enable syntaxhighlighting
syntax on

" Force fileformat for Linux and Mac OS'
set fileformat=unix

" set encoding to UTF-8
set encoding=UTF-8

" Setup indentation for Python file.
au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |

" Setup default global indentation settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smarttab
set expandtab

" Print invisible characters
set list
set listchars=eol:.,tab:>-,trail:~,extends:>,precedes:<

" Highlights the whole line where is my cursor
set cursorline

" Enable line number
set number

" Start scrolling page 8 lines before cursor reeach the bottom.
set scrolloff=8

" Do not tell vim to show me if I am visual mode
" Airline plugin already do it.
set noshowmode

set conceallevel=1

" Disable bells sound
set noerrorbells visualbell t_vb=

" Enable undofile
set undodir=~/.vim/undodir
set undofile

" Setup search mode
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <CR> :noh<CR><CR>:<backspace>
