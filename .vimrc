set nocompatible

syntax on
filetype plugin on
filetype indent on

set t_Co=256
colorscheme pdesert

let mapleader = "\\"
set encoding=utf-8
set mouse=a
set number
set history=700
set autoread
set wildmenu
set wildignore=*.o,*~,*.pyc
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set showmatch
set hlsearch
set expandtab
set ruler
set laststatus=2
set tags=/Users/farzadp/env/ctags/lib/python2.7/site-packages/tags,tags

set ffs=unix,dos
set ff=unix

"set indentation for files"
augroup indent
    autocmd!
    au BufNewFile,BufRead *.js set tabstop=2 softtabstop=2 shiftwidth=2 et
    au BufNewFile,BufRead *.html set tabstop=2 softtabstop=2 shiftwidth=2 et
    au BuFNewFile,BufRead *.css set tabstop=2 softtabstop=2 shiftwidth=2 et
    au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 et
    au BufNewFile,BufRead *.feature set tabstop=2 softtabstop=2 shiftwidth=2 et
augroup END

"Plugins using vim-plug"
"call plug#begin()
"Plug 'mileszs/ack.vim'
"nnoremap ,a :Ack<space>
"nnore <C-J> :cn<CR>
"nnore <C-K> :cp<CR>
"nnore ,, :Ack <C-R><C-W><cr>
"Plug 'davidhalter/jedi-vim'
"let g:jedi#force_py_version = 2
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#completions_enabled = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#show_call_signatures = 0
"let g:jedi#smart_auto_mappings = 0
"Plug 'ctrlpvim/ctrlp.vim'
"nnoremap <silent> ,m :CtrlPMRUFiles<CR>
"nnoremap <silent> ,n :CtrlPTag<CR>
"let g:ctrlp_working_path_mode = ''
"Plug 'tpope/vim-fugitive'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"let g:airline_theme='term'
"let g:airline_theme='distinguished'
"Plug 'Glench/Vim-Jinja2-Syntax'
"Plug 'osyo-manga/vim-brightest'
"Plug 'stefandtw/quickfix-reflector.vim'
"Plug 'aspickard/vim-pydocstring'
"Plug 'groenewege/vim-less'
"Plug 'vim-scripts/taglist.vim'
"Plug 'majutsushi/tagbar'
"nnoremap <silent> ,b :TagbarToggle<CR>
"Plug 'craigemery/vim-autotag'
"Plug 'sjl/gundo.vim'
"nnoremap ,u :GundoToggle<CR>
"Plug 'tpope/vim-vinegar'
"Plug 'scrooloose/nerdtree'
"nnoremap ,f :NERDTreeToggle<cr>
"Plug 'justinmk/vim-sneak'
"Plug 'godlygeek/tabular'
"call plug#end()

"Move vertically by visual line"
nnoremap j gj
nnoremap k gk

"Splits"
set splitbelow
set splitright
nnoremap ,t :tab sp<cr>
nnoremap ,v :vsplit<cr>

"Resize splits with Ctrl-Shift-ArrowKeys"
nnoremap <C-S-Left> <C-W><lt>
nnoremap <C-S-Right> <C-W>>
nnoremap <C-S-Up> <C-W>+
nnoremap <C-S-Down> <C-W>-

"Move between splits with Ctrl-ArrowKeys"
nnoremap <C-Left> <C-W><left>
nnoremap <C-Right> <C-W><right>
nnoremap <C-Up> <C-W><up>
nnoremap <C-Down> <C-W><down>

"Convert JSON into pretty printed json"
command! FormatJSON execute "%!python -m json.tool"

"Fix format of psv cells
fun! FormatPSV() range
        exec ":'<,'>!python ~/.vim/python/format_psv.py"
endfun

vnoremap ,p :call FormatPSV()<CR>

nnoremap <leader>p :cd ~/Projects/<CR>

"Shortcut to navigate files"
nnoremap - :e %:h<cr>

"Remove trailing spaces"
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"Other
nnoremap ,s :split<cr>
nnoremap ,z :set wrap!<cr>
nnoremap ,q <silent> :ccl<cr>
noremap J j
noremap K k

"inoremap jj <esc>

"nnoremap ,v :tabe ~/.vimrc<cr>

nnoremap <F8> Oimport ipdb; ipdb.set_trace()<esc>
inoremap <F8> import ipdb; ipdb.set_trace()

"Settings for gvim"
"set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set mousemodel=popup "show context menu on right click

"Other"
set swapfile
set directory=~/.vim/tmp/swap/
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
"set backup
"set backupdir=~/.vim/tmp/backup/
"if !isdirectory(expand(&backupdir))
"    call mkdir(expand(&backupdir), "p")
"endif
set undofile
set undodir=~/.vim/tmp/undo/
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif

" Auto format cucumber tables https://gist.github.com/tpope/287147
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
