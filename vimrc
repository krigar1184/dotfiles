" Plugins {{{
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Lokaltog/powerline'
Plug 'sjl/gundo.vim'
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'python-mode/python-mode'
call plug#end()
" }}}

" Basic settings {{{
set autoread
set autowrite
set expandtab
set hlsearch
set incsearch
set listchars+=precedes:<,extends:>
set nocompatible
set nowrap
set number
set laststatus=2
set lazyredraw
set shiftwidth=4
set shiftround
set sidescroll=5
set smartindent
set tabstop=4
set winfixwidth
set winfixheight
set softtabstop=4
set t_Co=256
"set textwidth=120
set wildmenu
set softtabstop=4
set tildeop
set wildmenu
" }}}

set statusline=%f  " filename
set statusline+=%=  " align right
set statusline+=%y  " filetype
set statusline+=%m  " modified?
set statusline+=%r  " readonly?
set statusline+=%{FugitiveStatusLine()}


:filetype on

" Mappings {{{
let mapleader=","
let maplocalleader="\<space>"

autocmd vimenter * NERDTree

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

noremap <leader>_ ddkP
noremap <leader>- ddp

inoremap <leader><c-\> <esc>ddi
inoremap <leader><c-u> <esc>viwU<esc>i
nnoremap <leader><c-u> viwU<esc>
inoremap jk <esc>
vnoremap <leader>\ U

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`><esc>a"<esc>
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>' <esc>`<i'<esc>`><esc>a'<esc>

nnoremap H ^
nnoremap L $
onoremap p i(

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>

onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>
onoremap an[ :<c-u>normal! f[va[<cr>
onoremap al[ :<c-u>normal! F]va[<cr>

nnoremap <leader>b oimport ipdb;ipdb.set_trace(context=10)<esc>
" }}}

" Plugins {{{
  " Nerdtree config {{{
  nnoremap <leader>tn :NERDTreeToggle<cr>
  let g:NERDTreeShowHidden = 1
  let g:NERDTreeWinSize = 31
  let g:NERDTreeShowLineNumbers = 1
  let g:NERDTreeIgnore = ['\~$', '\.orig$']
  " }}}

  " Gundo {{{
  nnoremap <leader>u :GundoToggle<cr>
  " }}}

  " Solarized {{{
  set background = "dark"
  let g:solarized_termcolors = 256
  colorscheme solarized
  " }}}
  
  " Tagbar {{{
  nnoremap <F8> :TagbarToggle<cr>
  let g:tagbar_autofocus = 1
  let g:tagbar_sort = 1
  let g:tagbar_show_visibility = 1
  let g:tagbar_show_linenumbers = 1
  let g:autoshowtag = 1
  " }}}
  
  " CtrlP {{{
  let g:ctrlp_match_window = "bottom,order:ttb"
  let g:ctrlp_switch_buffer = 0
  let g:ctrp_working_path_mode = 0
  let g:ctrlp_user_command = 'ag %s -l --color --hidden -g ""'
  " }}}

  " Python-mode {{{
  let python_highlight_all = 1
  let g:pymode = 1
  let g:pymode_warnings = 1
  let g:pymode_trim_whitespaces = 1
  let g:pymode_python = 'python3.6'
  let g:pymode_indent = 1
  let g:pymode_folding = 0
  let g:pymode_doc = 1
  let g:pymode_lint = 0
  let g:pymode_lint_on_write = 1
  let g:pymode_list_checkers = ['pyflakes', 'pep8']
  let g:pymode_breakpoint = 0
  " }}}

  " Fugitive
  nnoremap <leader>gb :Gblame<cr>
  nnoremap <leader>gs :Gstatus<cr>
  nnoremap <leader>gg :Ggrep<cr>
  nnoremap <leader>gl :Glog<cr>
" }}}

" Vimscript file settings {{{
augroup ft_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Python file settings {{{
augroup ft_python
    autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>
    autocmd FileType python vnoremap <buffer> <localleader>dc <esc>`<idict(<esc>`>a)<esc>
    autocmd FileType python vnoremap <buffer> <localleader>lc <esc>`<ilist(<esc>`>a)<esc>
    autocmd FileType python :iabbrev <buffer> iff if:<left>
    autocmd FileType python :iabbrev <buffer> rt <cr>return<space>
augroup END
" }}}

" Markdown file settings {{{
augroup ft_markdown
    autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^[(==)\|(--)]\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^[(==)\|(--)]\\+$\r:nohlsearch\rg_vk0"<cr>
    autocmd FileType markdown onoremap <buffer> in@ :<c-u>execute "normal! /\\<\\w\\+@\\w\\+\\.\\w\\+\\>\r:nohlsearch\rviW"<cr>
    autocmd FileType markdown onoremap <buffer> an@ :<c-u>execute "normal! /\\<\\w\\+@\\w\\+\\.\\w\\+\\>\r:nohlsearch\rvaW"<cr>
augroup END
" }}}

" Ruby file settings {{{
augroup ft_ruby
    set tabstop=2
    set shiftwidth=2
augroup END
" }}}
