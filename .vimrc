
call plug#begin('~/.vim/plugged')
"Plug 'leafgarland/typescript-vim'
"tormaza Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-surround'
"Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'vim-scripts/taglist.vim'
Plug 'Raimondi/delimitMate'
"Plug 'airblade/vim-rooter'
Plug 'vim-scripts/utl.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/csv.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat' 
Plug 'tpope/vim-commentary'
"Plug 'vim-syntastic/syntastic'
"Plug 'lervag/vimtex'

call plug#end()

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#close_symbol = 'x'
let g:airline_extensions = ['tabline']
let g:airline_theme='minimalist'
let g:airline_skip_empty_sections = 1
let g:airline_section_y = ''
let g:airline_section_x = ''
let g:airline_section_z = '%3p%% %#__accent_bold#%{g:airline_symbols.linenr}%2l%#__restore__#%#__accent_bold#/%L%#__restore__# :%3v'
let g:airline_section_b = ''
let g:airline_section_c = '%<%f%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

set hidden

let g:rooter_patterns = ['Makefile']
let g:solarized_termcolors=256
set t_Co=256
set background=dark
set t_ut=
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
"colorscheme solarized
" ================ Persistent Undo ==================
if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif


set nobackup
set nowb
set noswapfile
set wildmenu
set nocp
"set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
"set guioptions -=T
"set hls
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set autochdir
"set foldmethod=indent
set foldmethod=syntax
set foldenable
syn region foldBraces start=/{/ end=/}/ transparent fold
syn region foldJavadoc start=,/\*\*, end=,\*/, transparent fold keepend
set wrap
"set textwidth=90
set textwidth=120
set wrapmargin=0
set autoread

filetype off
"colorscheme desert
filetype plugin indent on
syntax on
highlight lCursor guifg=NONE guibg=Cyan

if has("autocmd")
  filetype plugin indent on
endif

let mapleader=","
"let maplocalleader = ','
let maplocalleader=";"
" ## Edit .vimrc ##
map <leader>v :vsp $MYVIMRC<CR>
map <leader>V :source $MYVIMRC<CR>
" ==== Tabs ====
nmap <leader>t :tabnew<CR>
nmap <leader>w :tabclose<CR>
nmap <leader>, :tabnext<CR>
nmap <leader>. :tabprev<CR>
" ==== Folding ====
nmap <leader>f zf)
nmap <leader>a za
" fold all
" copy to system buffer
nmap <leader>y "+y
set foldlevelstart=20
set foldlevel=20
" TODO from vim buffer to sys
" Paste from Clipboard
nmap <leader>p "+p
nmap <leader>P o<ESC>"+P
" paste link
nmap <leader>l o<ESC>"+p0yss[
" paste link
" Copy vim def " buffer to clipboard
nmap <leader>s :let @+=@"<CR>

map <leader>r :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
nmap <leader>q :w<CR>
nmap <leader>e :q<CR>

nmap ё `
nmap Ж :
nmap ш i
nmap о j
nmap л k
nmap ф a
nmap Ф A
nmap б ,
nmap ю .
cmap ц w
cmap й q
cmap ч x
cmap у e
cmap ф a
nnoremap <space> za
"==== DEV ====
"map <F9> :w<CR>:exe "make java JavaSource=" . expand("%") . " JavaClass=" . substitute(expand("%:r"), "/", ".", "g")<CR>
"map <F10> :w<CR>:!make test<CR>
"map <F9> :w<CR> :!perl '%'<CR>
"map <C-F8> :!dot -Tpng % -o%.png && feh %.png<CR>
"F used: 1 2 3 4 5 6 7 9 10 11 12 free: 8, best 589 12 23
" substitute(expand("%:r"), "/", ".", "g")
"map <F8> :w<CR>:exe "make default SRC=" . expand("%")<CR>
"Java
"map <F3> :w<CR>:!javac '%' && java '%:r'<CR>
"C
"map <F10> :w<CR>:!clang '%' -o a.out && ./a.out<CR>
"
" Generic make by filename
map <F5> :w<CR>:!make '%:t:r'<CR>
map <F6> :w<CR>:!make '%:t:r'_debug<CR>
" BARE C
map <F7> :w<CR>:!gcc -Wall '%' -o /run/user/$(id -u)/a.out && ./run/user/$(id -u)/a.out<CR>
" BARE C++
map <F8> :w<CR>:!g++ -std=c++11 '%' -o /run/user/$(id -u)/a.out && ./run/user/$(id -u)/a.out<CR>
" SHELL
map <F9> :w<CR>:!./%<CR>
" MAKE
map <F3> :w<CR>:!make<CR>

" BARE Python
map <F10> :w<CR>:!python3 '%:t'<CR>
"VimL
map <F11> :w<CR>:source %<CR>

map <C-F9> :!python3 -i '%:t'<CR>
"==== Session ====
nmap <C-F5> :call MakeDefSession()<CR>
nmap <S-F5> :call LoadDefSession()<CR>
"==== NERDTree ====
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.pyc$']
nmap <leader>r :NERDTreeToggle<CR>
nmap <leader>Y :NERDTreeClose<CR>
nmap <leader>c :TlistToggle<CR>
nmap <leader>g :TableModeToggle<CR>
nmap <leader>x :TagbarToggle<CR>
nmap <Leader>u ysiw_ysiw_
nmap <leader>C :!ctags -R -o ~/mytags `pwd`<cr>
set tags=~/mytags
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
"nnoremap <leader>b :BufExplorer<CR>
" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>
nnoremap K i<CR><Esc>

iab ifmain if __name__=='__main__':<CR>
iabbrev #i #include
iabbrev #d #define

function! MakeDefSession()
  let b:filename = $HOME . "/.vim/sessions" . "/pythonDefSession.vim"
  exe "mksession! " . b:filename
endfunction
function! LoadDefSession()
  let b:filename = $HOME . "/.vim/sessions" . "/pythonDefSession.vim"
  exe 'source ' b:filename
endfunction

" Сохраняет сессии для каждого каталога
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
  echo "session make." . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction
" А так же при закрытии открытии восстанавливает сессию
" Adding automatons for when entering or leaving Vim
if(argc() == 0)
  au VimEnter * nested :call LoadSession()
endif
au VimLeave * :call MakeSession()
" ---конец сессий---

function! Mak()
    echom "mak"
    let g:file=expand('%:t:r')
    "vnew
    for i in [1, 2, 3]
        normal ggdG
        execute "silent r! make " . g:file
        execute "sleep 1"
    endfor
endfunction

set tabstop=4
set shiftwidth=4
set expandtab
set t_Co=256
set t_ut=

hi User1 ctermbg=None ctermfg=107
hi User2 ctermbg=None ctermfg=53
hi User3 ctermbg=None ctermfg=17
hi User4 ctermbg=None ctermfg=107
hi User5 ctermbg=None ctermfg=107
set statusline=
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%3*%y%*                "file type
set statusline +=%3*%=%*
set statusline +=%1*\ %<%F\ %*            "full path
"set statusline +=%3*%m%*                "modified flag
"set statusline +=%3*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor
set laststatus=2
set clipboard=unnamed
set clipboard=unnamedplus
colorscheme my

" AVOID SHIFT AND CTL
" enter to cmd mode
map <space> :
" leva
" gmap
"set fillchars+=vert:\ 
"highlight VertSplit ctermbg=238  ctermfg=238
let @d='f,lli'

" === netrw config ===
" bind :Vexplore
"nmap <leader>y :Vex<CR>
nmap <leader>r :Lexplore<CR>
" i toggle style
" s sort
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 35
let g:netrw_altv = 1

set wildmode=longest:list,full
