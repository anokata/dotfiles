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
 
" Plugin settings (let var)
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
let g:rooter_patterns = ['Makefile']

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 35
let g:netrw_altv = 1

let g:indexer_disableCtagsWarning=1
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1 
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|env\'
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

let g:NERDTreeWinPos = "left"
let g:NERDTreeChDirMode = 3
let NERDTreeIgnore = ['\.pyc$', '\node_modules']

let g:ranger_map_keys = 0
let g:fff#split = "30vnew"

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


" Color {{{
let g:solarized_termcolors=256
set t_Co=256
set background=dark
set t_ut=
set mouse=a
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight lCursor guifg=NONE guibg=Cyan
colorscheme soruby
"set fillchars+=vert:\ 
" }}}

" Basic settings {{{
let mapleader=","
let maplocalleader=";"
set autochdir
set autoindent
set autoread
set clipboard=unnamed
set clipboard=unnamedplus
set cmdheight=2
set conceallevel=1
set expandtab
set foldenable
set foldlevel=20
set foldlevelstart=20
set foldmethod=syntax
set hidden
set ignorecase
set iminsert=0
set imsearch=0
set laststatus=2
set lazyredraw
set nobackup
set nocompatible
set noswapfile
set nowritebackup
set number
set shiftwidth=4
set shiftwidth=4
set smartcase
set t_Co=256
set t_ut=
set tabstop=4
set tags=~/mytags
set textwidth=0
set wildmenu
set wildmode=longest:list,full
set wrap
set wrapmargin=0
" Status line
set statusline=
set statusline +=%3*%=%*
set statusline +=%1*\ %<%F\ %*            "full path
"set omnifunc=syntaxcomplete#Complete
"set keymap=russian-jcukenwin
"set guioptions -=T
"set guioptions -=L

if executable('rg')
    set grepprg=rg\ --color=never\ --vimgrep
endif

syn region foldBraces start=/{/ end=/}/ transparent fold

filetype off
filetype plugin indent on
syntax on
" }}}


" === Mapping {{{
source ~/.vim/config/bind-files
source ~/.vim/config/map-rus
source ~/.vim/config/abbrev
source ~/.vim/config/persistent-undo

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
" ==== Folding ====
"nmap <leader>f zf)
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
" Map ctrl-movement keys to window switching
" nnoremap <C-k> <C-w><Up>
nnoremap <C-j> <C-w><Down>
nnoremap <C-l> <C-w><Right>
nnoremap <C-h> <C-w><Left>
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

" Macros {{{
" param on new line
let @d='f,lli'
let @j='A {'
map <leader>k A {
" swap args in ()
let @w='0f(ldt,f)pui, p0f,dw'
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
