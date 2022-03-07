" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat' 
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/csv.vim'
Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/utl.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/DfrankUtil'
"Plug 'vim-scripts/code_complete'
Plug 'docunext/closetag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'pangloss/vim-javascript'
Plug 'mkomitee/vim-gf-python'
Plug 'valloric/matchtagalways'
Plug 'gorodinskiy/vim-coloresque'
Plug 'vim-scripts/utf8-math'
Plug 'ktonga/vim-follow-my-lead'
"Plug 'artur-shaik/vim-javacomplete2'
Plug 'stormherz/tablify'
"Plug 'sirver/ultisnips'
"Plug 'vim-scripts/math'
"Plug 'vim-scripts/Align'
"Plug 'easymotion/vim-easymotion'
"Plug 'airblade/vim-rooter'
"Plug 'vim-syntastic/syntastic'
"Plug 'vimplugin/project.vim'
"Plug 'hoxnox/indexer.vim'
"tormaza Plug 'dhruvasagar/vim-table-mode'
"Plug 'kassio/neoterm'
"Plug 'tpope/vim-speeddating'
"Plug 'jceb/vim-orgmode'
"Plug 'vim-ctrlspace/vim-ctrlspace'
"Plug 'vim-scripts/vimprj'
"Plug 'yuratomo/w3m.vim'
"Plug 'vim-scripts/OmniCppComplete'
"Plug 'LaTeX-Box-Team/LaTeX-Box'
"Plug 'lervag/vimtex'

call plug#end()
" }}}

" Plugin settings let {{{
let g:vimtex_compiler_latexrun = {
    \ 'build_dir' : '/tmp',
    \}
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '/tmp',
\}
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
let g:vimtex_latexmk_background=1

"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

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

"==== Session ====
nmap <C-F5> :call MakeDefSession()<CR>
nmap <S-F5> :call LoadDefSession()<CR>

"==== NERDTree ==== {{{
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.pyc$']
nmap <leader>r :NERDTreeToggle<CR>
nmap <leader>Y :NERDTreeClose<CR>
nmap <leader>c :TlistToggle<CR>
"nmap <leader>g :TableModeToggle<CR>
nmap <leader>x :TagbarToggle<CR>
" }}}
" }}}

" Color {{{
let g:solarized_termcolors=256
set t_Co=256
set background=dark
set t_ut=
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
colorscheme my
" colorscheme xcodedark
"solarized sonokai
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
set foldlevelstart=0
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
"set omnifunc=syntaxcomplete#Complete
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
"set keymap=russian-jcukenwin
" set guioptions -=T
" set guioptions -=L
syn region foldBraces start=/{/ end=/}/ transparent fold
syn region foldJavadoc start=,/\*\*, end=,\*/, transparent fold keepend

filetype off
filetype plugin indent on
syntax on
highlight lCursor guifg=NONE guibg=Cyan

if has("autocmd")
  filetype plugin indent on
endif

" Status line
set statusline=
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%3*%y%*                "file type
set statusline +=%3*%=%*
set statusline +=%1*\ %<%F\ %*            "full path
"set statusline +=%3*%m%*                "modified flag
"set statusline +=%3*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor
" }}}

" ================ Persistent Undo ================== {{{
if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
    redraw!
endif
" }}}

" Mapping {{{
nmap <leader>C :!ctags -R -o ~/mytags `pwd`<cr>
" ## Edit .vimrc ##
map <leader>v :vsp $MYVIMRC<CR>:set foldmethod=marker<cr>
map <leader>V :source $MYVIMRC<CR>
map <leader>ev :tabnew $MYVIMRC<CR>
map <leader>es :source %<CR>
" ==== Tabs ====
nmap <leader>t :tabnew<CR>
nmap <leader>w :tabclose<CR>
nmap <leader>, :tabnext<CR>
nmap <leader>. :tabprev<CR>
" ==== Folding ====
"nmap <leader>f zf)
"nmap <leader>f :set foldmethod=indent<CR>
nmap <leader>f :FZF!<CR>
"nmap <C-p> :FZF<CR>
nmap <leader>a za
" fold all
" copy to system buffer
" nmap <leader>y "+y
nmap <leader>y "*y
nmap <leader>Y "+y
" TODO from vim buffer to sys
" Paste from Clipboard
nmap <leader>p "+p
nmap <leader>P o<ESC>"+P
" Copy vim def " buffer to clipboard
" nmap <leader>s :let @+=@"<CR>
nmap <leader>s :let @*=@"<CR>
" paste link
"nmap <leader>l o<ESC>"+p0yss[

"map <leader>r :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
nmap <leader>q :w<CR>
nmap <leader>e :q<CR>
nmap <leader>X :!chmod +x %<CR>
nmap <Leader>u ysiw_ysiw_

" moving normal in russian
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

" run current line
noremap <c-c> yy:@"<CR>
" run paragraph
noremap <c-s-x> {V}kyy:@"<CR>}
"noremap <leader>c yy:@"<CR>
" enter will insert line
"noremap <cr> o<Esc>
noremap <leader><cr> xi<cr><esc>
" AVOID SHIFT AND CTL " enter to cmd mode
"noremap <space> :
"noremap q<space> q:

" typos correction and abbrevations
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev fi if
iabbrev funciotn function
iabbrev funciton function
iabbrev @@@ quartenium@gmail.com
iabbrev ifmain if __name__=='__main__':<CR>
iabbrev #i #include
iabbrev #d #define

inoremap jk <esc>
inoremap kj <esc>
inoremap <c-d> <esc>ddi
inoremap <c-u> <esc>viwUi

nnoremap - h
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap GG GGzz
"nnoremap <leader>g :exe 'W3m google ' . expand('<cword>')<CR>

" d(el) y(ank) c(hange) inside ()
onoremap p i(
" F select function name
onoremap <silent> F :<C-U>normal! 0f(hviw<CR>
" make open google word under cursor in tab
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" Map ctrl-movement keys to window switching
nnoremap <C-k> <C-w><Up>
nnoremap <C-j> <C-w><Down>
nnoremap <C-l> <C-w><Right>
nnoremap <C-h> <C-w><Left>
nnoremap <bs> <C-w><Left>
"nnoremap <leader>b :BufExplorer<CR>
" Toggle paste mode
nnoremap <silent> <F4> :set invpaste<CR>:set paste?<CR>
inoremap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" open previous buffer in vert split
nnoremap <leader>p :execute "rightbelow vsplit " . bufname("#")<cr>
" add semicolon in the end, save cursor
function! _Add_semi()
    let cmd=':execute "normal! mqA;\<esc>`q"'
    echo cmd
    execute cmd
endfunction
nnoremap <leader>; :call _Add_semi()<cr>

" Search by grep with quick-window mappings
"nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " %"<cr><cr>:cope<cr><c-w><c-w>
nnoremap <leader>n :cnext<cr>
nnoremap <leader>l :cclose<cr>

nnoremap <leader>d :execute "normal! a" . expand("%:p:h")<cr>
" }}}

"==== DEV ==== {{{

function CompileJava()
    " Run from source dir where package root
    " TODO Find root dir, if threre source, down n. or in prj dir
    let filename = expand('%:t:r')
    let package = getline(1)
    let packagename = split(package, ' ')[1]
    let packagename =  trim(packagename, ";")
    exec "cd ../../../"
    let path = substitute(packagename, '[.]', '/', 'g')
    
    let cmd = join([":silent !javac ", path, "/", filename, ".java -d ../classes/"], "")
    exec cmd
    let cmd = join(["!java -cp ../classes/ ", packagename, ".", filename], "")
    exec cmd
    exec "cd -"
    execute "redraw!"
endfunction

map <F3> :w<CR>:!make<CR>
map <F5> :w<CR>:!make '%:t:r'<CR>
map <F6> :w<CR>:!make <CR>
map <F6> :w<CR>:!javac -d ~/classes '%:t:r'.java && java -ea -cp ~/classes '%:t:r'<CR>
map <F7> :call CompileJava()<CR>
"map <F7> :w<CR>:!javac '%:t:r'.java -d ~/classes/<CR>:!java -cp ~/classes/ '%:t:r'<CR>
"map <F7> :w<CR>:!gcc -Wall '%' -o /run/user/$(id -u)/a.out && ./run/user/$(id -u)/a.out<CR>
map <F8> :w<CR>:!jar -cvmf ../../manifest ~/classes/'%:t:r'.jar -C ~/classes/ com<CR>:!java -jar ~/classes/'%:t:r'.jar<CR>
"map <F8> :w<CR>:!g++ -std=c++11 '%' -o /run/user/$(id -u)/a.out && ./run/user/$(id -u)/a.out<CR>
map <F9> :w<CR>:!texmake %<CR>
map <F9> :w<CR>:!make App<CR>
map <C-F9> :!python3 -i '%:t'<CR>
" SHELL
map <F9> :w<CR>:!./%<CR>
map <F10> :w<CR>:!python '%:t'<CR>
map <C-F10> :w<CR>:!epython '%:t'<CR>
"VimL
map <F11> :w<CR>:source %<CR>
"map <F3> :w<CR>:!javac '%' && java '%:r'<CR>
"map <F9> :w<CR> :!perl '%'<CR>
"map <F10> :w<CR>:!make test<CR>
"map <C-F8> :!dot -Tpng % -o%.png && feh %.png<CR>
" }}}

" Macros {{{
" param on new line
let @d='f,lli'
" logger
let @p='0fpcwlogger.debug(�kD�kDA)'
" log
let @l='0wdwilog.info(A)'
let @j='A {'
map <leader>k A {
" swap args in ()
let @w='0f(ldt,f)pui, p0f,dw'
" Java try 
let @t="Iclass :put =expand('%:t:r')A {lxkJopublic static void main(String[] args) {}}"
let @t="Itry {lxo} catch (Exception ex) { ex.printStackTrace(); }"
" temporary macros. for rainlin
let @m='/\<mdxExpertReportLink"f,a "exportFormats":["PDF","DOC","XLS","CSV","XML","PPT","ODT","ODS","ODP","DOCX","XLSX","PPTX"],":w'
let @n='/"WebReports.Controls.Report"bbbi"exportFormats":["PDF","DOC","XLS","CSV","XML","PPT","ODT","ODS","ODP","DOCX","XLSX","PPTX"],":w'
" }}}

" right way to use autocmd --- {{{ fold with za
augroup allAutoCmds
    autocmd!
    "autocmd FileType python colorscheme sonokai
    autocmd FileType python :iabbrev <buffer> iff if:<left>
    autocmd FileType vim setlocal foldmethod=marker
    "autocmd FileType java setlocal omnifunc=javacomplete#Complete
    "
    autocmd FileType markdown :onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
augroup END
" }}}

