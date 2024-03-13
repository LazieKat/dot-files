call plug#begin('~/vimfiles/bundle')

" themes and style
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'mhartington/oceanic-next'
Plug 'whatyouhide/vim-gotham'
Plug 'altercation/vim-colors-solarized'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'psliwka/vim-smoothie'
Plug 'luochen1990/rainbow'
Plug 'hzchirs/vim-material'

" VimShell
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim'

" organization
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'mbbill/undotree'
Plug 'itchyny/calendar.vim'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/indentLine'

Plug 'godlygeek/tabular'
Plug 'vim-scripts/Align'
Plug 'AndrewRadev/switch.vim'
Plug 'matze/vim-move'
Plug 'andymass/vim-matchup'
Plug 'mg979/vim-visual-multi'

Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'Jorengarenar/vim-MvVis'

Plug 'rhysd/vim-grammarous'

" focus
Plug 'junegunn/goyo.vim' 
Plug 'junegunn/limelight.vim'

" sinppets
Plug 'honza/vim-snippets'

" file type specific
Plug 'chrisbra/csv.vim'

" IDE-like features
"Plug 'vim-syntastic/syntastic'
"Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

""""""""""""""""""""""""""""""""""""

" airline config
"let g:airline_theme='durant'
"let g:airline_theme='dark'
"let g:airline_theme='cool'
let g:airline_powerline_fonts              = 1
let g:airline_theme                        = 'ayu_mirage'
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" rainbow brackets
let g:rainbow_active = 1

" syntastic config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0

" switch config
" let g:switch_mapping = "gs"
" let g:switch_custom_definitions = []
" autocmd FiletType <whatever> let b:switch_custom_definitions = []

" nerdcommenter config
" let g:NERDSpaceDelims = 1

" indentline config
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_leadingSpaceEnabled = '1'

" vim-startify confid
let g:startify_bookmarks = [
    \ '~/.vimrc'
    \ ]

" vimwiki directory
let g:vimwiki_list = [
            \ {'path': '~/OneDrive/Documents/__AAA/wikis/default'}
            \ ]

""""""""""""""""""""""""""""""""""""

set confirm
set nocompatible
set hidden
set ttyfast
set termguicolors
set encoding=UTF-8                " 
set noswapfile                    " no .swp files cuz they're annoying
set belloff=all                   " turn off bells
set showcmd                       " show command line at the bottom
set mouse=a
"set shell=powershell
syntax enable                     " enable syntax highlighting

set ruler                         " show curent position
set wrap                          " wrap long lines
set showmode                      " show current mode always

set guioptions=c
set lines=40
set columns=95
set textwidth=80
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

set wildmenu                      " proper tab completion
set wildmode=full                 " shoe list of possible completions

autocmd InsertEnter,InsertLeave * set cul!
autocmd BufReadPost assignments set lines=50 | set columns=60
autocmd BufReadPost outline set lines=50 | set columns=60

""""""""""""""""""""""""""""""""""""


command Cs cd ~/OneDrive/AAA/Academics/RU/SAIL
command Cd cd ~/OneDrive/Desktop


""""""""""""""""""""""""""""""""""

" " auto paranthases colsing
" inoremap ( ()<Left>
" inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")" 
" " auto brackets colsing
" inoremap [ []<Left>
" inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]" 

" " auto braces colsing
" inoremap { {}<Left>
" inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}" 
" inoremap {<return> {<return>}<Esc>O<Tab>

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


function! g:FindSpaces(current_line)
    " Define a list to store space positions
    let s:spaces = []

    " Find all spaces and store their positions
    let pos = -1
    while 1
        let pos = match(a:current_line, ' ', pos + 1)
        if pos == -1
            break
        endif
        call add(s:spaces, pos)
    endwhile

    return s:spaces
endfunction




function! g:LineLine()

    silent! execute line('.').'s/ \s\+//g'
    silent! execute line('.').'s/\s\+$//g'

    let s:current_line  = getline('.')
    let s:first_char    = s:current_line[0]
    let s:space_pos     = FindSpaces(getline('.'))
    let s:spos_end      = len(s:space_pos) - 1


    let s:current_line = substitute(s:current_line, '\%'.(s:space_pos[s:spos_end]+1).'c', ',', '')
    let s:current_line = substitute(s:current_line, '\%'.(s:space_pos[s:spos_end-1]+1).'c', ',', '')


    if s:first_char =~ '\d'
        let s:current_line = substitute(s:current_line, '\%'.(s:space_pos[0]+1).'c', ',', '')
        let s:current_line = substitute(s:current_line, '\%'.(s:space_pos[1]+2).'c', ',', '')
    else
        let s:current_line = substitute(s:current_line, '\%'.(s:space_pos[2]+1).'c', ',', '')
        let s:current_line = substitute(s:current_line, '\%'.(s:space_pos[3]+2).'c', ',', '')
    endif


    call setline(line('.'), s:current_line)
    let @/=""

endfunction

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
