call plug#begin('~/vimfiles/bundle')


" themes and style
Plug 'luochen1990/rainbow'
Plug 'mhartington/oceanic-next'
Plug 'mhinz/vim-signify'
Plug 'psliwka/vim-smoothie'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'


" navigation and organization
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'


" sinppets
Plug 'honza/vim-snippets'


" file type specific
Plug 'chrisbra/csv.vim'


" language servers
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" focus
Plug 'junegunn/goyo.vim' 
Plug 'junegunn/limelight.vim'


" recheck
"Plug 'vim-syntastic/syntastic'
"Plug 'dense-analysis/ale'
"Plug 'Shougo/vimproc.vim'
"Plug 'Shougo/vimshell.vim'
"Plug 'AndrewRadev/switch.vim'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"Plug 'itchyny/calendar.vim'
"Plug 'vimwiki/vimwiki'
"Plug 'andymass/vim-matchup'
"Plug 'junegunn/vim-easy-align'


" removed
"Plug 'mhinz/vim-startify'
"Plug 'rhysd/vim-grammarous'


call plug#end()

""""""""""""""""""""""""""""""""""""

" airline config
let g:airline_powerline_fonts              = 1
let g:airline_theme                        = 'dark'
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" rainbow brackets
let g:rainbow_active = 1

" vim-move
let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'S'

" indentline config
let g:indentLine_char = '¦'
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_leadingSpaceEnabled = '1'

" syntastic config
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list            = 1
" let g:syntastic_check_on_open            = 1
" let g:syntastic_check_on_wq              = 0

" switch config
" let g:switch_mapping = "gs"
" let g:switch_custom_definitions = []
" autocmd FiletType <whatever> let b:switch_custom_definitions = []

" nerdcommenter config
" let g:NERDSpaceDelims = 1

" vim-startify confid
"let g:startify_bookmarks = [
"    \ '~/.vimrc'
"    \ ]

" vimwiki directory
"let g:vimwiki_list = [
"            \ {'path': '~/OneDrive/Documents/__AAA/wikis/default'}
"            \ ]

""""""""""""""""""""""""""""""""""""

filetype plugin indent on
set confirm
set nocompatible
set hidden
set ttyfast
set termguicolors
set encoding=UTF-8
set noswapfile                    " no .swp files cuz they're annoying
set belloff=all                   " turn off bells
set showcmd                       " show command line at the bottom
set mouse=a
syntax enable                     " enable syntax highlighting

set ruler                         " show curent position
set wrap                          " wrap long lines
set showmode                      " show current mode always

if has('gui_running')
    set guioptions=c
    set lines=40
    set columns=95
endif

set updatetime=500
set guifont=Agave_Nerd_Font:h12          " gui font and size
colo OceanicNext                  " set theme

set number relativenumber         " set line numbers to relative
set signcolumn=number
set ai                            " enable auto indenting
set tabstop=4                     " set tab width
set shiftwidth=4                  " 
set expandtab                     " use spaces instead of tabs
set backspace=indent,eol,start    " let backspace delete anything

set showmatch                     " show matching brackets
set incsearch                     " show search results while typing
set hlsearch                      " highlight search results

set complete+=kspell              " add spelling to auto complete

set wildmenu                      " proper tab completion
set wildmode=full                 " show list of possible completions


autocmd InsertEnter,InsertLeave * set cul!

" autocmd BufReadPost assignments set lines=50 | set columns=60
" autocmd BufReadPost outline set lines=50 | set columns=60


""""""""""""""""""""""""""""""""""""


nnoremap    <F2>            :NERDTreeToggle<CR> 
nnoremap    <F3>            :TagbarToggle<CR> 
nnoremap    <F4>            :UndotreeToggle<CR> 

" easily resource .vimrc and current file
nnoremap    <Leader>sv      :source ~/.vimrc<CR>
nnoremap    <Leader>sc      :source %<CR>


" to copy an paste with systen

vnoremap    <Leader>d       "+d
nnoremap    <Leader>d       "+d

vnoremap    <Leader>y       "+y 
nnoremap    <Leader>y       "+y 

vnoremap    <Leader>p       "+p
nnoremap    <Leader>p       "+p

vnoremap    <Leader>x       "+x
nnoremap    <Leader>x       "+x

" for display stuff

nnoremap    <Leader>w       :set wrap!<CR>
nnoremap    /<space>        :let<space>@/=""<return>

noremap     _
    \ :let zoomfsize = substitute(&guifont, '^.*:h\([^:]*\).*$', '\1', '') - 1   <CR>
    \ :let &guifont  = substitute(&guifont, ':h\([^:]*\)', ':h' . zoomfsize, '') <CR>
noremap     +
    \ :let zoomfsize = substitute(&guifont, '^.*:h\([^:]*\).*$', '\1', '') + 1   <CR>
    \ :let &guifont  = substitute(&guifont, ':h\([^:]*\)', ':h' . zoomfsize, '') <CR>


"""""""""""""""""""""""""""""""""""""

inoremap <silent><expr> <CR>
    \ coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
