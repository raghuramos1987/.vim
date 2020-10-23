"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'terryma/vim-multiple-cursors'
set nocompatible               " be iMproved
set t_Co=256
filetype off                   " required!

if has('nvim')
    let s:editor_root=expand("~/.nvim")
else
    let s:editor_root=expand("~/.vim")
endif
set rtp+=~/.vim/bundle/Vundle.vim
let &rtp = &rtp . ',' . s:editor_root . '/bundle/Vundle.vim'
call vundle#begin()
"call vundle#rc()
call vundle#rc(s:editor_root . '/bundle')


" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" original repos on github
"Plugin 'powerline/powerline', {'rtp': '/usr/lib/python2.7/site-packages/powerline/bindings/vim/'}
"Plugin 'techlivezheng/vim-plugin-minibufexpl'
Plugin 'Chiel92/vim-autoformat'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'henrik/vim-qargs'
Plugin 'haya14busa/vim-stacktrace'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'goerz/ipynb_notedown.vim'
"Plugin 'vim-scripts/vim-nose'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'wting/gitsessions.vim'
Plugin 'xolox/vim-misc'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'numkil/ag.nvim'
Plugin 'davidhalter/jedi-vim'
"Plugin 'tell-k/vim-autopep8'
Plugin 'ervandew/supertab'
Plugin 'morhetz/gruvbox'
Plugin 'elzr/vim-json'
Plugin 'motus/pig.vim'
Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'edkolev/tmuxline.vim'

Plugin 'majutsushi/tagbar'

Plugin 'jceb/vim-orgmode'
Plugin 'vim-scripts/utl.vim'
Plugin 'tpope/vim-speeddating'
" Java and Scala
" Ensime
"Plugin 'ensime/ensime-vim'
Plugin 'derekwyatt/vim-scala'



" colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'nielsmadan/harlequin'
Plugin 'flazz/vim-colorschemes'
Plugin 'ColorSchemeMenuMaker'
Plugin 'desert-warm-256'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'
"Plugin 'Shougo/unite.vim'
Plugin 'Shougo/denite.nvim'
"Plugin 'ctrlp.vim'
"Plugin 'taglist.vim'
Plugin 'spacehi.vim'
" vim-scripts repos
" non github repos
" git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...
call vundle#end()            " required

"Taglist
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
" tab navigation like firefox
nnoremap Tk :bprevious<CR>
nnoremap Tj   :bnext<CR>
"map <Leader>mbe :MBEOpen<cr>
"map <Leader>mbc :MBEClose<cr>
"map <Leader>mbt :MBEToggle<cr>
nnoremap <C-t>     :tabnew<CR>:NERDTree<CR>
nnoremap tk <Esc>:tabprevious<CR>
nnoremap tj   <Esc>:tabnext<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ','
let g:mapleader = ','
let g:maplocalleader = "."

" Fast saving
nmap <leader>w :w<cr>
nmap <leader>e :bwipeout<cr>
nmap <leader>x :bw<cr>


map <leader>f  "zyw:exe "Ag ".@z.""<CR>

au BufNewFile,BufRead *.ftl setfiletype ftl
set nu
set smartcase

"vmap <C-c> y:call system("xclipboard", getreg("\""))<CR>

set tabstop=4
set shiftwidth=4

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O

nmap <leader>ne :NERDTreeToggle<cr>
nmap <leader>k :NERDTreeFind<cr>
"autocmd BufEnter * lcd %:p:h

"func GitGrep(...)
  "let save = &grepprg
  "set grepprg=git\ grep\ -n\ $*
  "let s = 'grep'
  "for i in a:000
    "let s = s . ' ' . i
  "endfor
  "exe s
  "let &grepprg = save
"endfun
"command -nargs=? G call GitGrep(<f-args>)
set backspace=indent,eol,start

set smartcase
set ignorecase
set softtabstop=4
set grepprg=ack
nnoremap <C-g> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType yaml set tabstop=2|set shiftwidth=2|set expandtab


set switchbuf+=usetab,newtab
set expandtab
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif
"let g:ackprg="$HOME/local/bin/ack"

"Jedi-vim pop up on .
let g:jedi#popup_on_dot = 0
"let g:jedi#use_tabs_not_buffers = 1
set completeopt=longest,menuone


"autocmd FileType python map <buffer> <leader>z :call Autopep8()<CR>
autocmd FileType python map <buffer> <leader>z :Autoformat<CR>
syntax on
colorscheme harlequin
set colorcolumn=80
set background=dark
hi Visual term=reverse cterm=reverse guibg=Grey
highlight colorcolumn ctermbg=6
"colorscheme solarized
"colorscheme molokai
"colorscheme gruvbox
"source $HOME/softwares/Python-2.7.8/Misc/Vim/vimrc

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1
let g:syntastic_python_pylint_quiet_messages = {"regex": ['\m\[C01\d\d,.*\]', '\m\[C01\d\d\]', '\m\[R09\d\d,.*\]', '\m\[W07\d\d,.*\]']}
let g:syntastic_python_flake8_args='--ignore=E501'

" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-S-c> :r ~/.vimbuffer<CR>

function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
        lclose
    endif
endfunction
nmap <C-i> :call ToggleErrors()<cr>
set updatetime=500
"highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white 
"highlight DiffChange term=reverse cterm=bold ctermbg=grey ctermfg=black 
"highlight DiffText cterm=bold ctermbg=yellow ctermfg=black 
"highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black 
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)"

"ctrlp ignores
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.js     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_tabpage_position = 'ac'
let g:SuperTabDefaultCompletionType = "context"
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
let g:miniBufExplCycleArround = 1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['flake8', 'pylint3']
let g:spacehi_spacecolor="ctermbg=blue"
let g:spacehi_tabcolor="ctermbg=red"
autocmd FileType python SpaceHi



set hlsearch
autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool
set clipboard=unnamed

" Rainbow paran stuff
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Denite
call denite#custom#var('file_rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
" Change mappings.
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', 'v', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('normal', 's', '<denite:do_action:split>', 'noremap')

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

nmap <silent> <C-G>  <Plug>GoldenViewSplit

"Denite
nmap <space> [unite]
nnoremap [unite] <nop>
nnoremap <silent> [unite]<space> :<C-u>Denite file_rec buffer<cr><c-u>
nnoremap <silent> [unite]b :<C-u>Denite buffer<cr><c-u>
"t		<denite:do_action:tabopen>
"nnoremap <silent> [unite]f :<C-u>Denite -toggle -auto-resize -buffer-name=files file_rec/async:!<cr><c-u>
"nnoremap <silent> [unite]e :<C-u>Denite -buffer-name=recent file_mru<cr>
"nnoremap <silent> [unite]y :<C-u>Denite -buffer-name=yanks history/yank<cr>
"nnoremap <silent> [unite]l :<C-u>Denite -auto-resize -buffer-name=line line<cr>
"nnoremap <silent> [unite]b :<C-u>Denite -auto-resize -buffer-name=buffers buffer file_mru<cr>
"nnoremap <silent> [unite]/ :<C-u>Denite -no-quit -buffer-name=search grep:.<cr>
"nnoremap <silent> [unite]m :<C-u>Denite -auto-resize -buffer-name=mappings mapping<cr>
"nnoremap <silent> [unite]s :<C-u>Denite -quick-match buffer<cr>

"Tagbar
nmap <localleader>t :TagbarToggle<CR>

"Copy from clipboard (Linux)
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Linux copy to clipboard
vnoremap <C-c> "+y"

" Scala
"autocmd BufWritePost *.scala silent :EnTypeCheck
"nnoremap <localleader>t :EnType<CR>
"au FileType scala nnoremap <localleader>df :EnDeclaration<CR>
