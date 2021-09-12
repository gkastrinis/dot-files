set tabstop=4       " Set tabstops to a width of four columns.
set softtabstop=4   " Determine the behaviour of TAB and BACKSPACE keys with expandtab.
set shiftwidth=4    " Determine the results of >>, <<, and ==.
set so=5
set hlsearch
set number
set tabpagemax=20
set backspace=2
set backspace=indent,eol,start
set antialias       " Turn on font antialiasing
set splitright
set splitbelow
set modelines=0     " Prevent security exploits that use modelines in files
set cryptmethod=blowfish  " Use strong encryption when requried
set encoding=utf-8  " Use the UTF-8 encoding
set showcmd         " Display incomplete commands
set ruler           " Position of cursor, relative position of text
set hidden          " Manage multiple buffers effectively
set laststatus=2    " Always show the statusline
set lazyredraw      " Do not update while in macro
set ttyfast         " Improves redrawing
set t_Co=256        " Use 256 colours
set cursorline
set textwidth=92    " Limit lines according to Julia's CONTRIBUTING guidelines.
set colorcolumn=93  " Highlight first column beyond the line limit.

syntax enable
colorscheme torte

call plug#begin('~/.vim/plugged')
Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

set hlsearch
hi Search ctermbg=Magenta
hi Search ctermfg=White
"hi ColorColumn ctermbg=Magenta

highlight ExtraWhitespace ctermbg=Red guibg=Red
" Show trailing whitespace:
match ExtraWhitespace /\s\+$/
" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/

" Uncomment the following to have Vim jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype
filetype plugin indent on

augroup templates
	autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
	autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
augroup END

au BufRead,BufNewFile *.rel setlocal expandtab
au BufRead,BufNewFile *.jl  setlocal expandtab

au BufRead,BufNewFile *.rel     set syntax=logiql
au BufRead,BufNewFile *.dl      set syntax=logiql
au BufRead,BufNewFile *.g4      set syntax=antlr4
au BufRead,BufNewFile *.gradle  set syntax=groovy
au BufRead,BufNewFile *.jimple  set syntax=java
au BufRead,BufNewFile *.shimple set syntax=java

noremap <C-H> <Esc>:noh<CR>
noremap <C-L> <Esc>:set list!<CR>
noremap <C-T> <Esc>:set expandtab!<CR>
noremap <C-K> <Esc>/\s\+$<CR>
" Paste won't change buffer contents
xnoremap p pgvy
xnoremap P Pgvy

nnoremap / /\v
vnoremap / /\v

noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

noremap <C-Right> <Esc>:tabn<CR>
inoremap <C-Right> <Esc>:tabn<CR>
noremap <C-Left> <Esc>:tabp<CR>
inoremap <C-Left> <Esc>:tabp<CR>
" Backup shortcuts for tab navigation
noremap <A-Right> <Esc>:tabn<CR>
inoremap <A-Right> <Esc>:tabn<CR>
noremap <A-Left> <Esc>:tabp<CR>
inoremap <A-Left> <Esc>:tabp<CR>
