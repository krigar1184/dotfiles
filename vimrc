set autoread
set cursorline
set clipboard+=unnamedplus
set expandtab
set encoding=utf-8
set hlsearch
set incsearch
set lazyredraw
set nowrap
set number
set rtp+=~/.vim,~/.vim/autoload,~/.vim/bundle
set tabstop=4
set shiftwidth=4
set smartindent
set softtabstop=4
set tildeop
set t_Co=256
set wildmenu

let mapleader=","

autocmd BufEnter term://* startinsert
autocmd BufLeave term://* stopinsert
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" === MAPPINGS ===
nnoremap <leader>ipdb oimport ipdb;ipdb.set_trace(context=10)<Esc>
nnoremap <leader>pdb oimport pdb;pdb.set_trace(context=10)
nnoremap gV `[v`]
nnoremap <leader>tn :NERDTreeToggle<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>et :vsp ~/.tmux.conf<CR>
nnoremap <leader>tt :sp term://bash<CR>
nnoremap <leader>a :Ack<CR>
nnoremap <leader>gb :Gblame<CR>

noremap <C-k> <C-w><Up>
noremap <C-j> <C-w><Down>
noremap <C-l> <C-w><Right>
noremap <C-h> <C-w><Left>

nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-s> :TestSuite<CR>
nnoremap <silent> t<C-l> :TestLast<CR>
nnoremap <silent> t<C-g> :TestVisit<CR>

let test#strategy="neovim"
let test#python#runner="pytest"

tnoremap <Esc> <C-\><C-n>

"=== PLUGINS ===

" netrw config
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_line=1
let g:netrw_chgwin=2

set nocp
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype on
filetype plugin on
filetype plugin indent on
filetype indent on

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" solarized
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusLineFlag()}
set statusline+=%*
let g:syntastic_loc_list_height=3

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntactic_loc_list_height = 5

" tagbar config
nmap <F8> :TagbarToggle<CR>
autocmd vimenter * nested :call tagbar#autoopen(0)
let g:tagbar_autofocus=1
let g:tagbar_sort=0
let g:tagbar_show_visibility=1
let g:tagbar_show_linenumbers=1
let g:autoshowtag=1

" vim-jsx config
let g:jsx_ext_required=0

" nerdtree
autocmd vimenter * NERDTree
let NERDTreeShowLineNumbers=1

" gitgutter config
let g:gitgutter_realtime=0
let g:gitgutter_eager=0

" python-mode config
let python_highlight_all=1
let g:pymode=1
let g:pymode_warnings=1
let g:pymode_trim_whitespaces=1
let g:pymode_options=1
let g:pymode_options_colorcolumn=1
let g:pymode_quickfix_minheight=3
let g:pymode_quickfix_maxheight=3
let g:pymode_python='python3'
let g:pymode_indent=1
let g:pymode_folding=0
let g:pymode_motion=1
let g:pymode_doc=1
let g:pymode_run=1
let g:pymode_breakpoint=1
let g:pymode_breakpointcmd='ipdb'
let g:pymode_lint=1
let g:pymode_lint_on_write=1
let g:pymode_lint_unmodified=0
let g:pymode_list_checkers=['pyflakes', 'pep8', 'mccabe', 'pep257', 'pylint']
let g:pymode_lint_ignore="E501"
let g:pymode_lint_cwindow=1
let g:pymode_lint_signs=1
let g:pymode_rope_autoimport=1
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_autoimport_bind="<C-c>ro"
let g:pymode_rope_organize_imports_bind="<C-c>ro"
let g:pymode_rope_extract_method_bind="<C-c>rm"
let g:pymode_rope_extract_variable_bind="<C-c>rl"
let g:pymode_rope_use_function_bind="<C-c>ru"

let g:ctrlp_match_window="bottom,order:ttb"
let g:ctrlp_switch_buffer=0
let g:ctrlp_working_path_mode=0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
