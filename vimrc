" These things cause problems.
"inoremap jj <Esc>
"set hlsearch
"nnoremap <Esc><Esc> :noh<return><Esc>

set nocompatible
" Facebook specific
"source $ADMIN_SCRIPTS/master.vimrc
"source /home/engshare/admin/scripts/vim/biggrep.vim
"set tags=TAGS;/
" vim7.2 intentionally makes * lamer for php.  wtf
autocmd FileType php setlocal iskeyword+=$

syntax on
colorscheme ir_black
" does not seem to work? EDIT: has to be *after colorscheme*
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set number
set tw=80
set hidden
"set fo=tcqrb " does not work
set wrap
set wildmode=list:longest " autocompletion is bash like

" Indentation and tabs.
set autoindent
" If the 'expandtab' option is on, spaces will be used to fill the amount of
" whitespace of the tab.
set expandtab
" we explicitly don't use 'smarttab' and 'softtabstop'
set shiftwidth=2
set tabstop=2

"inoremap jj <Esc>
set hlsearch
set incsearch " incremental search
set ignorecase
set smartcase " don't ignore case when it's not only lowercase.
"nnoremap <Esc><Esc> :noh<return><Esc>
nnoremap + <C-w>+
nnoremap - <C-w>-
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
" maximize window
map <C-m> <C-w>_

" Status line.
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]


set viminfo='50,"50           " '=marks for x files, "=registers for x files
set scrolloff=5               " scroll offsett, min lines above/below cursor
set scrolljump=5              " jump 5 lines when running out of the screen
set sidescroll=10             " minumum columns to scroll horizontally
set showcmd                   " show command status
set showmatch                 " flashes matching paren when one is typed
set showmode                  " show editing mode in status (-- INSERT --)
set ruler                     " show cursor position

" not sure this is needed
set noerrorbells              " no bells in terminal

"other things (from
"http://b4winckler.wordpress.com/2009/07/10/a-minimal-vim-configuration/)
set backspace=indent,eol,start
