set t_Co=256                      " enable 256 color
colo evening                      " set theme
syntax enable                     " enable syntax highlighting
set noswapfile                    " no .swp files cuz they're annoying
set ai                            " enable auto indenting
set tabstop=4                     " set tab width
set backspace=indent,eol,start    " let backspace delete anything
set showmatch                     " show matching brackets
set incsearch                     " show search results while typing
set hlsearch                      " highlight search results
set encoding=utf-8 
set ruler                         " show curent position
set number relativenumber         " set line numbers to relative
set wrap                          " wrap long lines
set belloff=all                   " turn off bells
set showcmd                       " show command line at the bottom
set wildmenu                      " proper tab completion
set wildmode=full                 " shoe list of possible completions
set guifont=Consolas:h11          " gui font and size
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


""""""""""""""""""""""""""""""""""""
nnoremap /<space> :let<space>@/=""<return>
