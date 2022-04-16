" Remember use: marks, S, C-m
" [] [[ [{ ][ ]]
" daw vaw
" usefull bindings not used:  = - space bs Bind C-Fx S-Fx (F1-F12)

"" <-=== Plugins ===->
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
Plug 'tpope/vim-unimpaired'
Plug 'nelstrom/vim-visual-star-search'
Plug 'chamindra/marvim'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-calc'
" Plug 'andersevenrud/compe-tmux', { 'branch': 'cmp' }
Plug 'dhruvasagar/vim-dotoo'

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
Plug 'vim-scripts/code_complete'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'dylanaraps/fff.vim'

Plug 'xolox/vim-colorscheme-switcher'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

"Plug 'tpope/vim-vinegar'
"Plug 'leafgarland/typescript-vim'
call plug#end()
 
" === Load configs ===
source ~/.vim/config/plugins
source ~/.vim/config/settings
source ~/.vim/config/bindings
source ~/.vim/config/bind-files
source ~/.vim/config/dev
source ~/.vim/config/map-rus
source ~/.vim/config/abbrev
source ~/.vim/config/persistent-undo
source ~/.vim/config/plugin-settings
source ~/.vim/config/ui
source ~/.vim/config/macros
source ~/.vim/config/autocmds


" <-=== Mapping ===->

" === Navigation ===
nnoremap GG GGzz
" navigate to next inner block
noremap <leader>nb /{[^}]*$<CR>
" open files on cursor always
nmap gF :tabnew <cfile><CR>
nmap <C-W><C-F> :tabnew <cfile><CR>
" no highlight
nmap <localleader>hh :noh<CR>
" double esc to no highlight
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
" Quick search
nnoremap <localleader>n :cnext<cr>
nnoremap <localleader>l :cclose<cr>

" === Editing ===
nmap <leader>q :w<CR>
nnoremap <C-s> :w<CR>
nmap <leader>e :q<CR>
nmap <leader>X :!chmod +x %<CR>
" Substitute
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
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
" replace
nmap <C-A-r> :%s/
" paste as markdownlink
nmap <localleader>mpl 0yss)$T/yt)0O<ESC>pyss]$Jx
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
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" Toggle paste mode
nnoremap <silent> <F4> :set invpaste<CR>:set paste?<CR>
inoremap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>
" add semicolon in the end, save cursor
nnoremap <leader>; mqA;<ESC>`q
" insert current path
nnoremap <leader>d :execute "normal! a" . expand("%:p:h")<cr>

" === IDE ===
nmap <localleader>a :AirlineToggle<CR>
nmap <leader>C :!ctags -R -o ~/mytags `pwd`<cr>

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
" vim config files open bindings
nmap <localleader>cb :tabnew ~/.vim/config/bindings<CR>
nmap <localleader>pp :tabnew ~/.vim/config/plugins<CR>
nmap <localleader>cs :tabnew ~/.vim/config/settings<CR>

" === Plug package mappings ===
nmap <localleader>pi :PlugInstall<CR>
nmap <localleader>pc :PlugClean!<CR>
nmap <localleader>pa O<ESC>IPlug '<ESC>p
nmap <localleader>pA <localleader>pa,V<localleader>pi

" ### Config .vimrc ###
nmap <leader>v :vsp $MYVIMRC<CR>:set foldmethod=marker<cr>
nmap <leader>V :source $MYVIMRC<CR>
nmap <leader>n :vsp $HOME/.vimrc<CR>:set foldmethod=marker<cr>
nmap <leader>N :source $HOME/.vimrc<CR>
nmap <C-k> :tabnew $MYVIMRC<CR>
nmap <leader>ev :tabnew $MYVIMRC<CR>
nmap <leader>es :source %<CR>

" === Tabs ===
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

" === window ===
noremap <C-A-w> ZZ
noremap <C-q> :qa<CR>
noremap <C-A-q> :qa!<CR>
" Map ctrl-atl-movement keys to window switching
nnoremap <Up> <C-w><Up>
nnoremap <Down> <C-w><Down>
nnoremap <Right> <C-w><Right>
nnoremap <Left> <C-w><Left>
nnoremap <bs> <C-w><Left>

" === Notes ===
"command! -nargs=1 Ngrep vimgrep "<args>" $NOTES_DIR/**/*.md
command! -nargs=1 Ngrep grep "<args>" -g "*.md" $NOTES_DIR
nnoremap <leader>nn :Ngrep 

" === insert mode mappings ===
" moving in insert mode
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
" inoremap jk <esc>
inoremap kj <esc>
" delete line
inoremap <c-d> <esc>ddi
" uppercase
inoremap <c-u> <esc>viwUi

" FIX:
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
" imap <c-x><c-f> <plug>(fzf-complete-path)
"nnoremap <leader>b :BufExplorer<CR>

" === Operators ===
" ?
onoremap p i(
" F select function name
onoremap <silent> F :<C-U>normal! 0f(hviw<CR>


" NOTE: not used
"nmap <leader>f :set foldmethod=indent<CR>
" nmap <Leader>u ysiw_ysiw_
" nnoremap <space> za
" noremap <leader>c yy:@"<CR>
" noremap <leader><cr> xi<cr><esc>
" nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<left><left>
" nnoremap <leader>rc :%s/\<<C-r><C-w>\>//gc<left><left><left>
"nmap <leader>gr :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
" open previous buffer in vert split
" nnoremap <leader>p :execute "rightbelow vsplit " . bufname("#")<cr>

"==== Session ====
"nmap <C-F5> :call MakeDefSession()<CR>
"nmap <S-F5> :call LoadDefSession()<CR>

" Search by grep with quick-window mappings
" nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " %"<cr><cr>:cope<cr><c-w><c-w>

