"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'terryma/vim-multiple-cursors'
set nocompatible               " be iMproved
set t_Co=256
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" original repos on github
"Plugin 'powerline/powerline', {'rtp': '/usr/lib/python2.7/site-packages/powerline/bindings/vim/'}
"Plugin 'techlivezheng/vim-plugin-minibufexpl'
Plugin 'henrik/vim-qargs'
Plugin 'Shougo/vimproc.vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/vim-nose'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'wting/gitsessions.vim'
Plugin 'xolox/vim-misc'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rking/ag.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'ervandew/supertab'
Plugin 'morhetz/gruvbox'

" colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'ColorSchemeMenuMaker'
Plugin 'desert-warm-256'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite.vim'
"Plugin 'ctrlp.vim'
Plugin 'taglist.vim'
Plugin 'spacehi.vim'
" vim-scripts repos
" non github repos
" git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...
"call vundle#end()            " required


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
map <Leader>mbe :MBEOpen<cr>
map <Leader>mbc :MBEClose<cr>
map <Leader>mbt :MBEToggle<cr>
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

" Fast saving
nmap <leader>w :w<cr>
nmap <leader>e :bwipeout<cr>

syntax enable
"set background=dark

map <leader>f  "zyw:exe "Ag ".@z.""<CR>

au BufNewFile,BufRead *.ftl setfiletype ftl
set nu
set smartcase

"vmap <C-c> y:call system("xclipboard", getreg("\""))<CR>

set tabstop=4
set shiftwidth=4

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O

set colorcolumn=80
nmap <leader>ne :NERDTreeToggle<cr>
nmap <leader>k :NERDTreeFind<cr>
"autocmd BufEnter * lcd %:p:h

func GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfun
command -nargs=? G call GitGrep(<f-args>)
set backspace=indent,eol,start

set smartcase
set ignorecase
set softtabstop=4
set grepprg=ack
nnoremap <C-g> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab
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
set completeopt=longest,menuone

nmap <leader>t :TlistToggle<cr>
let Tlist_Show_One_File = 1

autocmd FileType python map <buffer> <leader>z :call Autopep8()<CR>
set background=dark
syntax on
"colorscheme molokai
colorscheme gruvbox
"source $HOME/softwares/Python-2.7.8/Misc/Vim/vimrc
let Tlist_WinWidth = 50

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1
let g:syntastic_python_pylint_quiet_messages = {"regex": ['\m\[C01\d\d,.*\]', '\m\[C01\d\d\]', '\m\[R09\d\d,.*\]', '\m\[W07\d\d,.*\]']}


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
let g:syntastic_python_checkers = ['pyflakes']
let g:spacehi_spacecolor="ctermbg=blue"
let g:spacehi_tabcolor="ctermbg=red"
"autocmd syntax * if modifiable && ft!='unite' | SpaceHi | endif
autocmd FileType python SpaceHi
"autocmd BufWinEnter * if &modifiable && &ft!='unite' | SpaceHi | endif
"autocmd InsertEnter * if &modifiable && &ft!='unite' | SpaceHi | endif
"autocmd InsertLeave * if &modifiable && &ft!='unite' | SpaceHi | endif
"autocmd BufWinLeave * if &modifiable && &ft!='unite' | NoSpaceHi | endif


" unite
let s:cache_dir = '~/.vim/.cache'

"function! s:unite_settings()
    "nmap <buffer> Q <plug>(unite_exit)
    "nmap <buffer> <esc> <plug>(unite_exit)
    "imap <buffer> <esc> <plug>(unite_exit)
"endfunction
function! s:get_cache_dir(suffix)
      return resolve(expand(s:cache_dir . '/' . a:suffix))
endfunction
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#custom#profile('default', 'context', {
      "\ 'start_insert': 1
      "\ })

let g:unite_data_directory=s:get_cache_dir('unite')
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=500
let g:unite_update_time = 200


let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
let g:unite_source_grep_recursive_opt=''
"autocmd FileType unite call s:unite_settings()

nmap <space> [unite]
nnoremap [unite] <nop>
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'bin/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'affine/tmp/',
      \ '.sass-cache',
      \ 'node_modules/',
      \ 'bower_components/',
      \ 'dist/',
      \ '.git5_specs/',
      \ '.pyc',
      \ ], '\|'))

nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async:! buffer file_mru bookmark<cr><c-u>
nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async:!<cr><c-u>
nnoremap <silent> [unite]e :<C-u>Unite -buffer-name=recent file_mru<cr>
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer file_mru<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>
"let g:unite_split_rule = 'botright'
call unite#custom#profile('default', 'context', {
    \   'start_insert': 1,
    \   'winheight': 10,
    \ })

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  imap <buffer> jj      <Plug>(unite_insert_leave)
  "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

  imap <buffer><expr> j unite#smart_map('j', '')
  imap <buffer> <TAB>   <Plug>(unite_select_next_line)
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  imap <buffer><expr> x
          \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
  nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
  nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
  nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> l
          \ unite#smart_map('l', unite#do_action('default'))

  let unite = unite#get_current_unite()
  if unite.profile_name ==# 'search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
  nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
          \ empty(unite#mappings#get_current_filters()) ?
          \ ['sorter_reverse'] : [])

  " Runs "split" action by <C-s>.
  imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction"}}}

" For ack.
if executable('ack-grep')
   let g:unite_source_grep_command = 'ack-grep'
   let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
   let g:unite_source_grep_recursive_opt = ''
endif
