call plug#begin('~/vimfiles/bundle')

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'chrisbra/csv.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'mhinz/vim-signify'

call plug#end()

let g:airline_powerline_fonts=1
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


""""""""""""""""""""""""""""""""""""

set updatetime=500
set nocompatible
set hidden
set ttyfast
set termguicolors
colo evening                      " set theme
syntax enable                     " enable syntax highlighting
set noswapfile                    " no .swp files cuz they're annoying
set ai                            " enable auto indenting
set tabstop=4                     " set tab width
set shiftwidth=4                  " 
set expandtab                     " use spaces instead of tabs
set backspace=indent,eol,start    " let backspace delete anything
set showmatch                     " show matching brackets
set incsearch                     " show search results while typing
set hlsearch                      " highlight search results
set encoding=UTF-8                " 
set ruler                         " show curent position
set number relativenumber         " set line numbers to relative
set wrap                          " wrap long lines
set belloff=all                   " turn off bells
set showcmd                       " show command line at the bottom
set wildmenu                      " proper tab completion
set wildmode=full                 " shoe list of possible completions
set guifont=CaskaydiaCove_NF:h10  " gui font and size
set showmode                      " show current mode always
autocmd InsertEnter,InsertLeave * set cul!


""""""""""""""""""""""""""""""""""""

" auto paranthases colsing
inoremap ( ()<Left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")" 

" auto brackets colsing
inoremap [ []<Left>
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]" 

" auto braces colsing
inoremap { {}<Left>
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}" 
inoremap {<return> {<return>}<Esc>O<Tab>

nmap <F8> :TagbarToggle<CR> 

""""""""""""""""""""""""""""""""""""
nnoremap /<space> :let<space>@/=""<return>
