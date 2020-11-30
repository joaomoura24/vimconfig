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
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'ycm-core/YouCompleteMe'
"Plugin 'neoclide/coc.nvim'
Plugin 'SirVer/ultisnips'
Plugin 'vim-syntastic/syntastic'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-system-copy' " for copying ang pasting from clipboard
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'lifepillar/vim-solarized8'
Plugin 'roxma/vim-window-resize-easy'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'unblevable/quick-scope' " highlight 1st searchable letter

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
" Open and Source .vimrc
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
" ------------------------------------------------------------------------------------------------
"  Some general configurations
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Automatically change the directory to current
set autochdir
" ------------------------------------------------------------------------------------------------
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
" set wildmode=longest,list
" ------------------------------------------------------------------------------------------------
" Display name of the current file
set laststatus=2
" ------------------------------------------------------------------------------------------------
" Close and open preview window
function! PreviewWindowOpened()
    for nr in range(1, winnr('$'))
        if getwinvar(nr, "&ft") == "qf"
            " found a preview
            return 1
        endif  
    endfor
    return 0
endfun
nnoremap <silent> <expr> <Leader>c g:PreviewWindowOpened() ? "\:cclose<CR>" : "\:copen<CR>"
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
" SuperTab: (supertab)
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 0
" ------------------------------------------------------------------------------------------------
" YouCompleteMe:
" auto close the completion window
"" fun! GoYCM()
nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
nnoremap <buffer> <silent> <leader>d :YcmCompleter GetDoc<CR>
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_auto_hover = ''
nmap <leader>D <plug>(YCMHover)
"" endfun
" ------------------------------------------------------------------------------------------------
"  Decide autocompletion tool depending on the source file
" autocmd Filetype typescript :call GoCoc()
"" autocmd Filetype typescript :call GoYCM()
"" autocmd Filetype cpp,cxx,h,hpp,c :call GoCoc()
" ------------------------------------------------------------------------------------------------
" UtilSnipts:
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ------------------------------------------------------------------------------------------------
"  solarized8
colorscheme solarized8
" set background=dark
" ------------------------------------------------------------------------------------------------
"  nerdtree
" lets
let g:NERDTreeAutoDeleteBuffer=1
" open nerdtree when opening the file
" autocmd vimenter * NERDTree
" close nerdtree window when closing last vim window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTre") && b:NERDTree.isTabTree()) | q | endif
" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
" ------------------------------------------------------------------------------------------------
"  nerdtree git
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
" ------------------------------------------------------------------------------------------------
"  asyncrun
autocmd filetype python nnoremap <Leader>x :AsyncRun python3 %<CR>
autocmd filetype cpp nnoremap <Leader>mm :AsyncRun make<CR>
autocmd filetype cpp nnoremap <Leader>mx :AsyncRun make exec<CR>
autocmd filetype cpp nnoremap <Leader>mc :AsyncRun make clean<CR>
" ------------------------------------------------------------------------------------------------
" quick-scope:
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" ------------------------------------------------------------------------------------------------
