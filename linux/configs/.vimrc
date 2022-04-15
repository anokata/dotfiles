" Remember use: marks, S, C-m
" [] [[ [{ ][ ]]

"" === Plugins === {{{
call plug#begin('~/.vim/plugged')
" Base
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat' 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" New try
Plug 'tpope/vim-speeddating'
Plug 'svermeulen/vim-subversive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/npm.nvim'
Plug 'Shougo/denite.nvim'

" to try
Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
"nmap :Prosession

" Old
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'docunext/closetag.vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'ktonga/vim-follow-my-lead'
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-unimpaired'
Plug 'valloric/matchtagalways'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/utf8-math'
Plug 'vim-scripts/utl.vim'
Plug 'wakatime/vim-wakatime'
Plug 'flazz/vim-colorschemes'
Plug 'sainnhe/everforest'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'vim-scripts/code_complete'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'dylanaraps/fff.vim'

"Plug 'tpope/vim-vinegar'
"Plug 'leafgarland/typescript-vim'
call plug#end()

" }}}
 
" === Load configs ===
source ~/.vim/config/basic
source ~/.vim/config/bind-files
source ~/.vim/config/map-rus
source ~/.vim/config/abbrev
source ~/.vim/config/persistent-undo
source ~/.vim/config/plugin-settings
source ~/.vim/config/ui
source ~/.vim/config/macros


syn region foldBraces start=/{/ end=/}/ transparent fold

filetype off
filetype plugin indent on
syntax on


" === Mapping {{{
" open files on cursor always
nmap gF :e <cfile><CR>
nmap <C-W><C-F> :tabnew <cfile><CR>

" === FM ===
nmap <C-b> :NERDTreeToggle<CR>
nmap <leader>n1 :NERDTree-cd<CR>:pwd<CR>
nmap <leader>n2 :NERDTree-CD<CR>:pwd<CR>
nmap <leader>c :TlistToggle<CR>
nmap <leader>x :TagbarToggle<CR>
nmap <leader>l :TagbarToggle<CR>
nmap <C-F1> :NERDTreeFind<CR>
nmap <S-F1> :F<CR>
nmap tf :FZF!<CR>
nmap <C-f> :FZF<CR>
nmap <C-A-o> :FZF<CR>
nmap <leader>r :Ranger<CR>
"nmap <C-r> :Ranger<CR>
"TODO Bind C-Fx S-Fx


" Plug package mappings
nmap <localleader>pi :PlugInstall<CR>
nmap <localleader>pc :PlugClean<CR>
nmap <localleader>pa IPlug '<ESC>px
nmap <leader>C :!ctags -R -o ~/mytags `pwd`<cr>
" ## Edit .vimrc ##
map <leader>v :vsp $MYVIMRC<CR>:set foldmethod=marker<cr>
map <leader>V :source $MYVIMRC<CR>
map <leader>n :vsp $HOME/.vimrc<CR>:set foldmethod=marker<cr>
map <leader>N :source $HOME/.vimrc<CR>
map <C-k> :tabnew $MYVIMRC<CR>
map <leader>ev :tabnew $MYVIMRC<CR>
map <leader>es :source %<CR>
" ==== Tabs ====
nmap <leader>t :tabnew<CR>
nmap <C-n> :tabnew<CR>
nmap <leader>w :tabclose<CR>
nmap <leader>, :tabnext<CR>
nmap <leader>. :tabprev<CR>
nmap tn :tabnew<CR>
nmap tw :tabclose<CR>
nmap th :tabnext<CR>
nmap tl :tabprev<CR>
nmap <C-l> gt 
nmap <C-h> gT
" ==== Folding ====
"nmap <leader>f :set foldmethod=indent<CR>
nmap <leader>a za
" fold all
" copy to system buffer
" nmap <leader>y "+y
nmap <leader>y "*y
nmap <leader>Y "+y
" Paste from Clipboard
nmap <leader>p "+p
nmap <leader>P o<ESC>"+P
" Copy vim def " buffer to clipboard
" nmap <leader>s :let @+=@"<CR>
nmap <leader>s :let @*=@"<CR>
" paste link
"nmap <leader>l o<ESC>"+p0yss[

"map <leader>gr :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
nmap <leader>q :w<CR>
nmap <leader>e :q<CR>
nmap <leader>X :!chmod +x %<CR>
nmap <Leader>u ysiw_ysiw_

nnoremap <space> za

" noremap <leader>c yy:@"<CR>
" noremap <leader><cr> xi<cr><esc>
" nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<left><left>
" nnoremap <leader>rc :%s/\<<C-r><C-w>\>//gc<left><left><left>

inoremap jk <esc>
inoremap kj <esc>
inoremap <c-d> <esc>ddi
inoremap <c-u> <esc>viwUi

nnoremap - h
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap GG GGzz

onoremap p i(
" F select function name
onoremap <silent> F :<C-U>normal! 0f(hviw<CR>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" Map ctrl-atl-movement keys to window switching
nnoremap <Up> <C-w><Up>
nnoremap <Down> <C-w><Down>
nnoremap <Right> <C-w><Right>
nnoremap <Left> <C-w><Left>
nnoremap <bs> <C-w><Left>
"nnoremap <leader>b :BufExplorer<CR>
" Toggle paste mode
nnoremap <silent> <F4> :set invpaste<CR>:set paste?<CR>
inoremap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" open previous buffer in vert split
" nnoremap <leader>p :execute "rightbelow vsplit " . bufname("#")<cr>
" add semicolon in the end, save cursor
function! _Add_semi()
    let cmd=':execute "normal! mqA;\<esc>`q"'
    echo cmd
    execute cmd
endfunction
nnoremap <leader>; :call _Add_semi()<cr>

nnoremap <leader>d :execute "normal! a" . expand("%:p:h")<cr>
" }}}

"==== DEV ==== {{{
" run current line
noremap <c-c> yy:@"<CR>
" run paragraph
noremap <c-s-x> {V}kyy:@"<CR>}

map <F5> :w<CR>:!make '%:t:r'<CR>
"map <F7> :w<CR>:!gcc -Wall '%' -o /run/user/$(id -u)/a.out && ./run/user/$(id -u)/a.out<CR>
"map <F8> :w<CR>:!g++ -std=c++11 '%' -o /run/user/$(id -u)/a.out && ./run/user/$(id -u)/a.out<CR>
map <C-F9> :!python3 -i '%:t'<CR>
map <F9> :w<CR>:!./%<CR>
map <F10> :w<CR>:!python '%:t'<CR>
map <F11> :w<CR>:source %<CR>
"map <C-F8> :!dot -Tpng % -o%.png && feh %.png<CR>
" }}}

" right way to use autocmd 
augroup allAutoCmds
    autocmd!
    autocmd FileType javascript set formatprg=prettier-eslint\ --stdin
    autocmd DirChanged global :NERDTreeCWD
    autocmd FileType netrw setlocal bufhidden=wipe
    autocmd FileType python :iabbrev <buffer> iff if:<left>
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType markdown :onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType c,cpp,java,php,myb,rust,javascript,typescript autocmd BufWritePre <buffer> %s/\s\+$//e
augroup END

" NeoVim specific config
if !has('nvim')
    
endif

"command! -nargs=1 Ngrep vimgrep "<args>" $NOTES_DIR/**/*.md
command! -nargs=1 Ngrep grep "<args>" -g "*.md" $NOTES_DIR
nnoremap <leader>nn :Ngrep 

" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
imap <c-x><c-f> <plug>(fzf-complete-path)

"==== Session ====
"nmap <C-F5> :call MakeDefSession()<CR>
"nmap <S-F5> :call LoadDefSession()<CR>

" Search by grep with quick-window mappings
" nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " %"<cr><cr>:cope<cr><c-w><c-w>
"nnoremap <leader>n :cnext<cr>
" nnoremap <leader>l :cclose<cr>
nmap <C-q> :qa<CR>
nmap <C-A-q> :qa!<CR>
nmap <C-UP> :tc ..<CR>:pwd<CR>

" === Editing mappings
" duplicate line up/down
nmap <C-A-k> yykp
nmap <C-A-j> yyp
nmap <C-A-UP> yykp
nmap <C-A-DOWN> yyp
nmap <A-S-UP> yykp
nmap <A-S-DOWN> yyp
" move line up/down
nmap <A-UP> ddkP
nmap <A-DOWN> ddp
nmap <A-k> ddkP
nmap <A-j> ddp


"
" Substitute
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)

" window
nmap <C-A-w> ZZ
