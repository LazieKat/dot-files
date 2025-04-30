"""""""""""""""""""""""""""""""""""""
"    Vim-Plug Plugins
"""""""""""""""""""""""""""""""""""""

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
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'tpope/vim-commentary'
Plug 'vim-ctrlspace/vim-ctrlspace'


" sinppets
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'


" file type specific
Plug 'chrisbra/csv.vim'


" language servers
Plug 'neoclide/coc.nvim', {'commit': '0ba0b8b'}


" focus
Plug 'junegunn/goyo.vim' 
Plug 'junegunn/limelight.vim'


" recheck
"Plug 'AndrewRadev/switch.vim'
"Plug 'Shougo/vimproc.vim'
"Plug 'Shougo/vimshell.vim'
"Plug 'andymass/vim-matchup'
"Plug 'dense-analysis/ale'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"Plug 'itchyny/calendar.vim'
"Plug 'junegunn/vim-easy-align'
"Plug 'vim-syntastic/syntastic'
"Plug 'vimwiki/vimwiki'


" removed
"Plug 'mhinz/vim-startify'
"Plug 'rhysd/vim-grammarous'


call plug#end()


"""""""""""""""""""""""""""""""""""""
"   Coc Extensions
"""""""""""""""""""""""""""""""""""""

function CocPumConfirm()
    try
        return coc#pum#visible()
    catch /.*/
        return 0
    endtry
endfunction


function CocMakeExtensionsList()
    let stats = CocAction("extensionStats")
    let g:coc_my_installed_extensions = []

    for ext in stats
        call add(g:coc_my_installed_extensions, ext['id'])
    endfor
endfunction


function CocIsInstalled(name)
    return index(g:coc_my_installed_extensions, a:name) != -1
endfunction


function CocInstallExtensions(names)
    for ext in a:names
        if !CocIsInstalled(ext)
            let ch = input("Coc: Extension '" . ext . "' is not installed. Do you want to install it? [Y,n] ")
            let ch = ch[0]
            echo "\n"

            if ch == 'y' || ch == ''
                echo "Installing..."
                execute 'CocInstall ' . ext
            else
                echo "Aborting install..."
            endif
        endif
    endfor
endfunction


function CocSyncSetup()
    call CocMakeExtensionsList()

    call CocInstallExtensions([ 
        \ "coc-marketplace",
        \ "coc-clangd",
        \ "coc-ccls",
        \ "coc-vimlsp",
        \ "coc-pyright",
        \ "coc-sh"
        \ ])

    echomsg "Coc Extensions Synced"
endfunction

command CocSyncSetup call CocSyncSetup()


"""""""""""""""""""""""""""""""""""""
"    Plugins Config
"""""""""""""""""""""""""""""""""""""

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


"""""""""""""""""""""""""""""""""""""
"    Vim Settings
"""""""""""""""""""""""""""""""""""""

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
set guifont=Agave_Nerd_Font:h12   " gui font and size
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


"""""""""""""""""""""""""""""""""""""
"   Remappings
"""""""""""""""""""""""""""""""""""""

nnoremap    <F2>            :NERDTreeToggle<CR> 
nnoremap    <F3>            :TagbarToggle<CR> 
nnoremap    <F4>            :UndotreeToggle<CR> 

" easily resource .vimrc and current file
nnoremap    <Leader>sv      :source ~/.vimrc<CR>
nnoremap    <Leader>sc      :source %<CR>


" to copy an paste with systen (Doesn't work with WSL)
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


" for autocomplete
inoremap <silent><expr> <CR>
    \ CocPumConfirm() ? coc#pum#confirm() : "\<CR>"
