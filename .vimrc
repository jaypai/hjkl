" lightline settings
set encoding=utf8
set termencoding=utf8
set laststatus=2
let g:lightline = {'colorscheme': 'jellybeans'}

" basic settings
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set t_Co=256
set colorcolumn=80
set hls
""set ignorecase

" colorscheme settings
syntax enable
" For GVIM
if has('gui_running')
    colorscheme jellybean
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
else
    colorscheme Monokai
endif

" Transparent background
"hi Normal          ctermfg=252 ctermbg=none

" SHIFT + TAB
" for command mode
nmap <S-Tab> <<
" for insert mode
imap <S-Tab> <C-d>
" imap <S-Tab> <Esc><<i
" for block mode / Visual block move
vmap <Tab> >gv
vmap <S-Tab> <gv

"<Esc> and <C-O> lag fix
"set timeout timeoutlen=0 ttimeoutlen=0

" Move lines and blocks up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Gvim terminal Cursor Block
set guicursor=n-v-c:block-Cursor
set guicursor+=i:block-Cursor

" AutoCompletePop BugFix
autocmd FileType py set omnifunc=xmlcomplete#CompleteTags noci
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
autocmd FileType css set omnifunc=xmlcomplete#CompleteTags noci

" Split Window Navigation
:nmap <silent> <C-h> :wincmd h<CR>
:nmap <silent> <C-j> :wincmd j<CR>
:nmap <silent> <C-k> :wincmd k<CR>
:nmap <silent> <C-l> :wincmd l<CR>

" IndentLine plugin settings
let g:indentLine_char = '|'

" Fix of . bug of AutoCompletePop
filetype on
filetype plugin on

" Fix themes putting underline for href's
let html_no_rendering=1
imap {{ {{}}<Esc>hi
"autocmd vimenter * Opsplore

"tab completion for emmet.vim
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
