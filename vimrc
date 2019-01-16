call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'sjl/gundo.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'plytophogy/vim-virtualenv'
Plug 'edkolev/tmuxline.vim'
Plug 'mhinz/vim-signify'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'tpope/vim-fireplace'
Plug 'editorconfig/editorconfig-vim'
Plug 'autozimu/LanguageClient-neovim', { 'rev': 'next',  'do': 'bash install.sh' }
Plug 'chrisbra/vim-diff-enhanced'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'rust-lang/rust.vim'
Plug 'janko-m/vim-test'
call plug#end()

set autoread
set autowrite
set clipboard+=unnamedplus
set expandtab
set hlsearch
set incsearch
set laststatus=2
set lazyredraw
set listchars+=precedes:<,extends:>
set nocompatible
set nowrap
set number
set previewheight=5
set shiftwidth=4
set shiftround
set sidescroll=5
set smartindent
set softtabstop=4
set tabstop=4
set t_Co=256
set textwidth=0
set tildeop
set undofile
set wildmenu
set winfixwidth
set winfixheight


set statusline=%f  " filename
set statusline+=%=  " align right
set statusline+=%y  " filetype
set statusline+=%m  " modified?
set statusline+=%r  " readonly?
set statusline+=%{FugitiveStatusLine()}

:filetype on
:filetype plugin on

" Mappings
let mapleader=","
let maplocalleader="\<space>"

autocmd vimenter * NERDTree

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bn :bnext<cr>

noremap <leader>_ ddkP
noremap <leader>- ddp

inoremap <leader><c-\> <esc>ddi
inoremap <leader><c-u> <esc>viwU<esc>i
nnoremap <leader><c-u> viwU<esc>
vnoremap <leader>\ U

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>
nnoremap <leader>st :!tmux source-file ~/.tmux.conf<cr>

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

nnoremap <leader>d oimport ipdb;ipdb.set_trace(context=10)<esc>
nnoremap <leader>D Oimport ipdb;ipdb.set_trace(context=10)<esc>

" Plugins
  " Nerdtree config
  nnoremap <leader>tn :NERDTreeToggle<cr>
  let g:NERDTreeShowHidden = 1
  let g:NERDTreeWinSize = 31
  let g:NERDTreeShowLineNumbers = 1
  let g:NERDTreeIgnore = ['\~$', '\.orig$']

  " Gundo
  nnoremap <leader>u :GundoToggle<cr>

  " Solarized
  set background = "dark"
  let g:solarized_termcolors = 256
  colorscheme jellybeans

  " Tagbar
  nnoremap <c-t> :TagbarToggle<cr>
  let g:tagbar_autofocus = 1
  let g:tagbar_sort = 1
  let g:tagbar_show_visibility = 1
  let g:tagbar_show_linenumbers = 1
  let g:autoshowtag = 1

  " Fugitive
  nnoremap <leader>gb :Gblame<cr>
  nnoremap <leader>gs :Gstatus<cr>
  nnoremap <leader>gg :Ggrep<cr>
  nnoremap <leader>gl :Glog<cr>

  " LSP
  let g:deoplete#enable_at_startup = 1

  if executable('pyls')
    let g:LanguageClient_serverCommands = {
      \ 'rust': ['~/cargo/bin/rustup', 'run', 'stable', 'rls'],
      \ 'python': ['pyls'],
    \ }

    nnoremap <F2> :LanguageClient_contextMenu()<cr>
    nnoremap <silent> K :call LanguageClient#textDocument_hover()<cr>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<cr>
    nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<cr>

    "set omnifunc=LanguageClient#complete

    let g:LanguageClient_selectionUI = 'fzf'
    let g:LanguageClient_diagnosticsEnable = 1
    let g:LanguageClient_diagnosticsList = 'Quickfix'
    let g:LanguageClient_windowLogMessageLevel = 'Error'
    let g:LanguageClient_fzfContextMenu = 1

    au User lsp_setup call lsp#register_server({
      \'name': 'pyls',
      \'cmd': {server_info->['pyls']},
      \'whitelist': ['python'],
      \})
  endif

  " Ale
  let g:ale_linters = {
    \'python': ['pyls'],
    \'bash': ['shell'],
    \'zsh': ['shell'],
    \'dockerfile': ['hadolint'],
    \'vim': ['vint'],
    \'clojure': ['joker'],
    \'JSON': ['jsonlint'],
    \'SQL': ['sqlint'],
    \'XML': ['xmllint'],
  \}
  let g:ale_fixers = [
    \'remove_trailing_lines',
    \'trim_whitespace',
  \]

  let g:ale_enable = 1
  let g:ale_fix_on_save = 0
  let g:ale_lint_on_text_changed = 0
  let g:ale_lint_on_enter = 1
  let g:ale_lint_on_filetype_changed = 1
  let g:ale_open_list = 0
  let g:ale_list_window_size = 3
  let g:ale_warn_about_trailing_blank_lines = 1
  let g:ale_warn_about_trailing_whitespace = 1
  let g:ale_set_highlights = 0
  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1
  let g:ale_list_window_vertical = 0
  let g:ale_python_flake8_options = '--ignore=E501'

  autocmd User ALELintPost call s:ale_loclist_limit()  " see https://github.com/w0rp/ale/issues/1164

  function! s:ale_loclist_limit()
      if exists("b:ale_list_window_size_max")
          let b:ale_list_window_size = min([len(ale#engine#GetLoclist(bufnr('%'))), b:ale_window_size_max])
      elseif exists("g:ale_list_window_size_max")
          let b:ale_list_window_size = min([len(ale#engine#GetLoclist(bufnr('%'))), g:ale_list_window_size])
      endif
  endfunction

  " Signify
  let g:signify_vcs_list = ['git']
  let g:signify_realtime = 1

  " Airline {{{
  let g:airline_theme = 'jellybeans'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#tabgar#enabled = 1
  let g:airline#extensions#tagbar#flags = 's'
  let g:airline#extensions#tmuxline#enabled = 1
  let g:airline#extensions#nerdtree#enabled = 1
  let g:airline#extensions#ale#enabled = 1
  let g:airlint#init#vim_async = 1
  let g:airline_powerline_fonts = 1
  let g:airline_left_sep = "\ue0b0"

  " Ripgrep
  nnoremap <leader>rg :Rg<cr>
  let g:rg_highlight = 1

  " Diff-enhanced
  if &diff
      let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
  endif

  " FZF
  let g:fzf_buffers_jump = 1
  nnoremap <c-f> :History<cr>
  nnoremap <c-p> :Files<cr>
  nnoremap <c-g> :Rg<cr>
  nnoremap <c-b> :Buffers<cr>

  " Vim-test
  let test#strategy = "asyncrun"

  nnoremap <silent> t<C-n> :TestNearest<cr>
  nnoremap <silent> t<C-f> :TestFile<cr>
  nnoremap <silent> t<C-s> :TestSuite<cr>
  nnoremap <silent> t<C-l> :TestLast<cr>
  nnoremap <silent> t<C-g> :TestVisit<cr>
  nnoremap <c-g> :Rg<cr>
  nnoremap <c-b> :Buffers<cr>

  let g:fzf_buffers_jump = 1

" Vimscript file settings
augroup ft_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Python file settings
augroup ft_python
    autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>
    autocmd FileType python vnoremap <buffer> <localleader>dc <esc>`<idict(<esc>`>a)<esc>
    autocmd FileType python vnoremap <buffer> <localleader>lc <esc>`<ilist(<esc>`>a)<esc>
    autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END

" Markdown file settings
augroup ft_markdown
    autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^[(==)\|(--)]\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^[(==)\|(--)]\\+$\r:nohlsearch\rg_vk0"<cr>
    autocmd FileType markdown onoremap <buffer> in@ :<c-u>execute "normal! /\\<\\w\\+@\\w\\+\\.\\w\\+\\>\r:nohlsearch\rviW"<cr>
    autocmd FileType markdown onoremap <buffer> an@ :<c-u>execute "normal! /\\<\\w\\+@\\w\\+\\.\\w\\+\\>\r:nohlsearch\rvaW"<cr>
augroup END

" Ruby file settings
augroup ft_ruby
    set tabstop=2
    set shiftwidth=2
augroup END
