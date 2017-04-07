
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
"Plug 'leafgarland/typescript-vim'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-rooter'

call plug#end()

let g:rooter_patterns = ['Makefile']
" ================ Persistent Undo ==================
if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif

let NERDTreeIgnore = ['\.pyc$']

set nobackup
set nowb
set noswapfile
set wildmenu
set nocp
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set guioptions -=T
"set hls
set nu
set expandtab
set tabstop=4
set shiftwidth=4
set autochdir
"set foldmethod=indent
set foldmethod=syntax
set foldenable
syn region foldBraces start=/{/ end=/}/ transparent fold
syn region foldJavadoc start=,/\*\*, end=,\*/, transparent fold keepend
set wrap
set textwidth=90
set autoread

filetype off
colorscheme desert
filetype plugin indent on
syntax on
highlight lCursor guifg=NONE guibg=Cyan

if has("autocmd")
  filetype plugin indent on
endif

let mapleader=","
let maplocalleader=";"
" ## Edit .vimrc ##
map ,v :vsp $MYVIMRC<CR>
map ,V :source $MYVIMRC<CR>
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
" Copy vim def " buffer to clipboard
nmap <leader>s :let @+=@"<CR>

map <leader>r :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

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
"F used: 1 2 3 4 5 6 7 9 10 11 12 free: 8
" substitute(expand("%:r"), "/", ".", "g")
map <F8> :w<CR>:!ant compile dist install<CR>
map <F9> :w<CR>:exe "make java JavaSource=" . expand("%") . " JavaClass=" . substitute(expand("%:r"), "/", ".", "g")<CR>
"Shell
map <F2> :w<CR>:!./%<CR> 
"Java
map <F3> :w<CR>:!javac '%' && java '%:r'<CR>
"Generic make by filename
map <F5> :w<CR>:!make '%:t:r'<CR>
map <F6> :w<CR>:!make '%:t:r'debug<CR>
"C
map <F7> :w<CR>:!gcc -Wall '%' -o a.out && ./a.out<CR>
"C
map <F10> :w<CR>:!clang '%' -o a.out && ./a.out<CR>
"VimL
map <F11> :w<CR>:source %<CR>
"C++
map <F12> :w<CR>:!g++ -std=c++11 '%' -o a.out && ./a.out<CR>
"map <F9> :w<CR>:!python3 '%:t'<CR>
"map <F9> :w<CR> :!perl '%'<CR>
"map <C-F8> :!dot -Tpng % -o%.png && feh %.png<CR>
"map <C-F9> :!python3 -i '%:t'<CR>
"map <F7> :w<CR> :!gcc -Wall '%' -lncurses -o a.out && ./a.out<CR>
"==== Session ====
nmap <C-F5> :call MakeDefSession()<CR>
nmap <S-F5> :call LoadDefSession()<CR>
"==== NERDTree ==== 
nmap <leader>T :NERDTree<CR>
nmap <leader>Y :NERDTreeClose<CR>
nmap <Leader>u ysiw_ysiw_
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
"echo '>^.^<'
