" For getting vimrc working on other pcs
" echo "runtime vimrc" > .vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'vim-latex/vim-latex'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
"" Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'vim-syntastic/syntastic'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'lifepillar/vim-solarized8'
Plugin 'roxma/vim-window-resize-easy'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ------------------------------------------------------------------------------------------------
:nnoremap <leader>ev :tabnew ~/.vim/vimrc<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
" ------------------------------------------------------------------------------------------------
" Plug in for automatically install other plugins
" execute pathogen#infect()
" Automatically detect the file type and set options
" filetype plugin indent on
" Default auto-complete for C family
" let g:ycm_always_populate_location_list = 1
" Vim navigation between split windows
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
" More natural split opening
set splitbelow
set splitright
" Encoding
set encoding=utf-8
" ------------------------------------------------------------------------------------------------
" Set the numbers of the lines in the first column"
set number relativenumber
" ------------------------------------------------------------------------------------------------
" Set incremental search when using /
set incsearch
set hlsearch
" ------------------------------------------------------------------------------------------------
" Set spell check to British
syntax on
" set spell spelllang=en
"set spell spelllang=pt
"set spell spelllang=en_gb
" ------------------------------------------------------------------------------------------------
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab
" ------------------------------------------------------------------------------------------------
" Set tabs ans eol's visible"
set list
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" ------------------------------------------------------------------------------------------------
" Set vim to use the Tab in auto-completion similar to bash (without this use <ctrl-d>)"
set wildmode=longest,list
" ------------------------------------------------------------------------------------------------
" Display name of the current file
set laststatus=2
" ------------------------------------------------------------------------------------------------
" Display name and path of current file
"" set statusline+=%F
"" set statusline+=%=%-10((%c,%l/%L)%)\            " line and column
" ------------------------------------------------------------------------------------------------
" set dictionary="/usr/dict/words"
" Re map some vim-Latex keys
" imap <C-b> <Plug>Tex_MathBF
" imap <C-c> <Plug>Tex_MathCal
" imap <C-l> <Plug>Tex_LeftRight
" imap <buffer> <C-i> <Plug>Tex_InsertItemOnThisLine " auto completion of the
" let g:Tex_UseCiteCompletionVer2=0 " to make the cite auto completion work
" ------------------------------------------------------------------------------------------------
" Because of the youcomplete me:
" set backspace=indent,eol,start
" ------------------------------------------------------------------------------------------------
" For adding : for autocompletion
"setlocal iskeyword+=-
" set iskeyword+=:
" Change the Ctrl-j in vim-latex
" ------------------------------------------------------------------------------------------------
"  jedi-vim
"" let g:jedi#use_tabs_not_buffers = 1
"" let g:jedi#force_py_version = 3
" let g:jedi#show_call_signatures = "2"
" ------------------------------------------------------------------------------------------------
" SuperTab:
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 0
" ------------------------------------------------------------------------------------------------
" YouCompleteMe:
" auto close the completion window
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>gd :YcmCompleter GoTo<CR>
" ------------------------------------------------------------------------------------------------
" UtilSnipts:
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ------------------------------------------------------------------------------------------------
"  solarized8
colorscheme solarized8
" set background=light
" ------------------------------------------------------------------------------------------------
"  nerdtree
" lets
let g:NERDTreeAutoDeleteBuffer=1
" autocmd vimenter * NERDTree
" close nerdtree window when closing last vim window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open nerdtree with leader
" nnoremap <leader>n :NERDTree<CR>
" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
" ------------------------------------------------------------------------------------------------
"  nerdtree git
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
" ------------------------------------------------------------------------------------------------
