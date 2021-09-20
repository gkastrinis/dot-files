syntax enable

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


call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'doums/darcula'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme darcula

let g:airline_section_x = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = 'simple'
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


set hlsearch
hi Search ctermbg=Magenta
hi Search ctermfg=White
hi ColorColumn ctermbg=Magenta

hi ExtraWhitespace ctermbg=Red guibg=Red
" Show trailing whitespace:
match ExtraWhitespace /\s\+$/
" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/

" Uncomment the following to have Vim jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype
filetype plugin indent on

au BufRead,BufNewFile *.rel setlocal expandtab | set syntax=logiql
au BufRead,BufNewFile *.jl setlocal expandtab
au BufRead,BufNewFile *.dl set syntax=logiql
au BufRead,BufNewFile *.g4 set syntax=antlr4
au BufRead,BufNewFile *.gradlw set syntax=groovy
au BufRead,BufNewFile *.jimple set syntax=java
au BufRead,BufNewFile *.shimple set syntax=java
au BufNewFile *.c 0r ~/.vim/templates/skeleton.c
au BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp


let mapleader = ','

noremap <C-H> :noh<CR>
noremap <C-L> :set list!<CR>
noremap <C-T> :set expandtab!<CR>
noremap <C-N> :set number!<CR>
noremap <C-K> /\s\+$<CR>
" Paste won't change buffer contents
xnoremap p pgvy
xnoremap P Pgvy
" Config search options
nnoremap / /\v
vnoremap / /\v
" Moving around tabs and splits
noremap <C-N> :tabp<CR>
noremap <C-M> :tabn<CR>
noremap <C-P> :wincmd w<CR>

noremap <C-F> :NERDTreeToggle<CR>
noremap <Leader>f :Files<CR>
noremap <Leader>l :Lines<CR>
"noremap <F12> <Esc>:syntax sync fromstart<CR>
