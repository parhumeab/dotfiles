set nocompatible

syntax on
filetype plugin on
filetype indent on

set t_Co=256

colorscheme desert

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
set title
set nowrap
set laststatus=2
set showcmd
set modelines=0
"set tags=/Users/farzadp/env/ctags/lib/python2.7/site-packages/tags,tags
set tags=/home/parhum/Projects/tags

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
    au BufNewFile,BufRead *.txt set tabstop=2 softtabstop=2 shiftwidth=2 et
augroup END

"https://vi.stackexchange.com/questions/4662/language-specific-configuration-colorcolumn"

"Plugins using vim-plug"
call plug#begin()
"Plug 'mileszs/ack.vim'
"nnoremap ,a :Ack<space>
"let g:ackprg = 'rg --vimgrep --no-heading'
"nnore <C-J> :cn<CR>
"nnore <C-K> :cp<CR>
"nnore ,, :Ack <C-R><C-W><CR>
"Plug 'davidhalter/jedi-vim'
"let g:jedi#force_py_version = 2
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#completions_enabled = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#show_call_signatures = 0
"let g:jedi#smart_auto_mappings = 0

"Plug 'ctrlpvim/ctrlp.vim'
"let g:ctrlp_map = ''
"nnoremap <silent> ,m :CtrlPMRUFiles<CR>
"nnoremap <silent> ,n :CtrlPTag<CR>
"nnoremap <silent> ,N :CtrlPTagAll<CR>
"let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'
"let g:ctrlp_working_path_mode = ''
"let g:ctrlp_custom_ignore = {
"    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$',
"    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$\|tags$' }
Plug 'tpope/vim-fugitive'
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
Plug 'majutsushi/tagbar'
nnoremap <silent> ,b :TagbarToggle<CR>
Plug 'craigemery/vim-autotag'
Plug 'sjl/gundo.vim'
nnoremap ,u :GundoToggle<CR>
Plug 'tpope/vim-vinegar'
"Plug 'scrooloose/nerdtree'
"nnoremap ,f :NERDTreeToggle<CR>
Plug 'justinmk/vim-sneak'
Plug 'godlygeek/tabular'
"Plug 'tpope/vim-cucumber'
"Plug 'nvie/vim-flake8'
"autocmd FileType python map <buffer> <F9> :call Flake8()<CR>
"Plug 'vim-syntastic/syntastic'
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
"let g:syntastic_python_checkers = ['flake8']
"nnoremap <silent> <F9> :SyntasticCheck<CR>
"nnoremap <silent> <F10> :SyntasticReset<CR>

Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim'

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_typescript_tsc_fname = ''

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'pbogut/fzf-mru.vim'
"nnoremap <silent> ,m :FZFMru<CR>
 

" Not working???
"nnoremap <silent> ,n :silent Tags<CR>
"nnoremap <silent> ,l :silent Files<CR>
"nnoremap <silent> <C-P> :silent Files<CR>
"nnoremap <silent> ,m :History<CR>

nnoremap ,n :Tags<CR>
nnoremap ,l :Files<CR>
nnoremap <C-P> :Files<CR>
nnoremap ,m :History<CR>

call plug#end()

"Move vertically by visual line"
nnoremap j gj
nnoremap k gk

"Splits"
set splitbelow
set splitright
nnoremap ,s :split<CR>
nnoremap ,v :vsplit<CR>

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

"Convert XML into indented XML"
command! FormatXML execute "%!xmllint --format -"

"Fix format of psv cells
"fun! FormatPSV() range
"        exec ":'<,'>!python ~/.vim/python/format_psv.py"
"endfun
"vnoremap ,p :call FormatPSV()<CR>
vnoremap ,p :Tabularize /<bar><CR>
vnoremap ,c :Tabularize /,<CR>

nnoremap <leader>p :cd ~/Projects/<CR>

"Shortcut to navigate files"
nnoremap - :e %:h<CR>

"Remove trailing spaces"
"nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:noh<CR>

"Other
nnoremap ,t :tab sp<CR>
nnoremap ,z :set wrap!<CR>
nnoremap ,q :cclose<CR>
noremap J j
noremap K k
"inoremap jj <Esc>
"nnoremap ,v :tabe ~/.vimrc<CR>

" pdb shortcut
nnoremap <F8> Oimport ipdb; ipdb.set_trace()<Esc>
inoremap <F8> import ipdb; ipdb.set_trace()

" Change relative numbers displayed
nnoremap <F11> :set relativenumber!<CR>

" Toggle numbering for copying and pasting
nnoremap <F12> :set number!<CR>

" Disable help button
inoremap <F1> <C-o>:echo<CR>
nnoremap <F1> <ESC>

" Open file in new tab
nnoremap <F2> <C-w>gf

""Better indentation
"vnoremap < <gv
"vnoremap > >gv

"Use capital W for save
command! W w

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
"set undofile
"set undodir=~/.vim/tmp/undo/
"if !isdirectory(expand(&undodir))
"    call mkdir(expand(&undodir), "p")
"endif

"Explore https://shapeshed.com/vim-netrw/"
"nnoremap ,f :Vexplore<CR>
"let g:netrw_banner=0
"let g:netrw_browse_split=4

" Allow clicking past the 220th column
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" Auto format cucumber tables https://gist.github.com/tpope/287147
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
nnoremap <silent> ,f :call <SID>align()<CR>

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

"From macvim docs, does it work?"
"let s:path = system("echo echo VIMPATH'${PATH}' | $SHELL -l")
"let $PATH = matchstr(s:path, 'VIMPATH\zs.\{-}\ze\n')
