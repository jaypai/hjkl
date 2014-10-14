" *** START PLUG SETUP ***
call plug#begin('~/.vim/plugged')
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/AutoClose'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
" Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'gregsexton/MatchTag'
Plug 'vim-scripts/tComment'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'Chronial/browser.vim'
Plug 'ap/vim-css-color'
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/xterm16.vim'
Plug 'junegunn/vim-easy-align'
" Plug 'vim-scripts/CSApprox'
Plug 'whatyouhide/vim-gotham'
" Plug 'davidhalter/jedi-vim'
" Plug 'dirkwallenstein/vim-autocomplpop'
" Plug 'vim-scripts/L9'
Plug 'antoyo/vim-licenses'
Plug 'nice/sweater'
call plug#end()
" *** END PLUG SETUP ***

" settings for GNU Screen
set nocompatible
imap <Esc>[A <Up> 
imap <Esc>[B <Down> 
imap <Esc>[C <Right>
imap <Esc>[D <Left>

" lightline settings
set encoding=utf8
set termencoding=utf8
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }

" basic settings
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
" set paste

" colorscheme settings
syntax enable
" required for solarized terminal
" set t_Co=16
set t_Co=256
set background=dark
if has("gui_running")
    colorscheme sweater
    set guioptions-=m  "menu bar
    set guioptions-=T  "toolbar
    set guioptions-=r  "scrollbar
else
    colorscheme sweater
endif
" colorscheme solarized
" highlight ColorColumn ctermbg=8
" highlight Normal ctermbg=NONE
" highlight nonText ctermbg=NONE

set colorcolumn=80
" highlight ColorColumn ctermbg=235
execute "set colorcolumn=" . join(range(81,335), ',')
set hls
""set ignorecase

" Transparent background
" hi Normal          ctermfg=252 ctermbg=none

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

" Gvim pasting from external buffer
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

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

" Move to the previous buffer with "gp"
nnoremap gp :bp<CR>
" Move to the next buffer with "gn"
nnoremap gn :bn<CR>
" List all possible buffers with "gl"
nnoremap gl :ls<CR>
" List all possible buffers with "gb" and accept a new buffer argument [1]
nnoremap gb :ls<CR>:b

" " tabnew abbrev
" ca tn tabnew
" ca th tabp
" ca tl tabn

" IndentLine plugin settings
let g:indentLine_char = '|'

" Fix of . bug of AutoCompletePop
filetype on
filetype plugin on

" Fix themes putting underline for href's
let html_no_rendering=1

" django variable dump issue
imap {{ {{}}<Esc>hi

" Tab completion for emmet.vim
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" taglist on the right hand side
let Tlist_Use_Right_Window   = 1
let Tlist_WinWidth = 50

" tagbar settings
let g:tagbar_width = 50

" Latex compile
map <silent> <F2> :<Esc>:w<CR>:!clear<CR>:!xelatex % <CR>:!evince main.pdf 2>/dev/null &<CR>: <Ins> <CR>

" auto start NERDTree on opening vim
" autocmd vimenter * NERDTree
map <F8> :NERDTreeToggle<CR>
" taglist toggle
nnoremap <F9> :TlistToggle<CR>

" remapping shift tab so that ctrl-d mapping can be used
let g:SuperTabMappingBackward = "<C-Tab>"
" SuperTab commpletion up to down
let g:SuperTabDefaultCompletionType = "<c-n>"

" snipmate initial trigger
imap <C-i> <Plug>snipMateNextOrTrigger

" syntastic config
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall'
let g:syntastic_javascript_checkers = ['jshint']

" save folding on exit
set viewoptions-=options
augroup vimrc
    autocmd BufWritePost *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      mkview
    \|  endif
    autocmd BufRead *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      silent loadview
    \|  endif
augroup END
