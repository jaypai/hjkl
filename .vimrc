" *** START PLUG SETUP ***
call plug#begin('~/.vim/plugged')
Plug 'Chronial/browser.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ajh17/Spacegray.vim'
Plug 'antoyo/vim-licenses'
Plug 'benjaminwhite/Benokai'
Plug 'bling/vim-airline'
Plug 'bronson/vim-visual-star-search'
Plug 'dasch/vim-mocha'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'fisadev/vim-isort'
Plug 'garbas/vim-snipmate'
Plug 'glidenote/memolist.vim'
Plug 'gorkunov/smartpairs.vim'
Plug 'gregsexton/MatchTag'
Plug 'honza/vim-snippets'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-gtfo'
Plug 'justinmk/vim-syntax-extra'
Plug 'kien/ctrlp.vim'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'nice/sweater'
Plug 'notpratheek/vim-luna'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sickill/vim-sunburst'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-smooth-scroll'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/AutoClose'
Plug 'vim-scripts/Railscasts-Theme-GUIand256color'
Plug 'vim-scripts/tComment'
Plug 'vim-scripts/taglist.vim'

" Plug 'dirkwallenstein/vim-autocomplpop'
" Plug 'ehamberg/vim-cute-python'
" Plug 'itchyny/lightline.vim'
" Plug 'skammer/vim-css-color'
" Plug 'vim-scripts/CSApprox'
" Plug 'vim-scripts/L9'
call plug#end()
" *** END PLUG SETUP ***


" settings for GNU Screen
set nocompatible
imap <Esc>[A <Up>
imap <Esc>[B <Down>
imap <Esc>[C <Right>
imap <Esc>[D <Left>


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
set background=dark
if has("gui_running")
    colorscheme luna
    set guioptions-=m  "menu bar
    set guioptions-=T  "toolbar
    set guioptions-=r  "scrollbar
    set guioptions-=L  "scrollbar
    " set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10
    set guifont=Inconsolata-g\ for\ Powerline\ Medium\ 11
else
    set t_Co=256
    colorscheme luna-term
endif
" colorscheme solarized
" highlight ColorColumn ctermbg=8
" highlight Normal ctermbg=NONE
" highlight nonText ctermbg=NONE


set hls
set ghr=0
set colorcolumn=80
highlight ColorColumn ctermbg=235
" execute "set colorcolumn=" . join(range(81,335), ',')
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
" set guicursor+=i:block-Cursor


" Gvim pasting from external buffer
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y


" copy/paste from system buffer
nmap <Leader>gy "+y
vmap <Leader>gy "+y
nmap <Leader>gp "+p


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
" let g:indentLine_char = '︙'
let g:indentLine_char = '⎸'
let g:indentLine_color_term = 239


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
let g:NERDTreeWinSize=30
" let g:NERDTreeWinPos = "right"
map <F8> :NERDTreeToggle<CR>
" taglist toggle
nnoremap <F9> :TlistToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup=0


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
let g:syntastic_python_checkers = ['pyflakes']
" use :Errors and :lclose
" let g:syntastic_auto_loc_list = 0


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


" Airline settings
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
set laststatus=2
set ttimeoutlen=50


" Fugitive settings
set diffopt+=vertical


" Jedi settings
let g:pymode_rope = 0


" " Gnome-Terminal
" if !exists("vimrc_autocommands_cursor_loaded")
"   let vimrc_autocommands_cursor_loaded = 1
"   if has("autocmd")
"     if executable("gconftool-2")
"       au VimEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"       au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"       au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"       au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"     endif
"   endif
" endif


" Konsole
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" Ctrl-p settings
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


" Git gutter settings
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk


" Smooth Scroll Settings
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

