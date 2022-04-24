" Remember use: marks, S, C-m
" [] [[ [{ ][ ]]
" daw vaw
 
" === Load configs === (<localleader>c* to open)
source ~/.vim/config/plugins
source ~/.vim/config/settings
source ~/.vim/config/bindings
source ~/.vim/config/plugin-settings
source ~/.vim/config/bind-files
source ~/.vim/config/dev
source ~/.vim/config/map-rus
source ~/.vim/config/abbrev
source ~/.vim/config/persistent-undo
source ~/.vim/config/ui
source ~/.vim/config/macros
source ~/.vim/config/autocmds

" TODO
" nnoremap <localleader><Esc> :Maps<CR>
" nnoremap <leader><Tab> :<CR>
" nnoremap <C-F1>
" nnoremap <F1>
" nnoremap <localleader><Tab> :<CR>
" nnoremap <localleader><localleader>
" nnoremap <leader><Esc> :<CR>
" nnoremap  :Lines! 
" nnoremap  :Buffers 
" nnoremap  :Windows 
" nnoremap  :Commands 
" nnoremap  :Maps 
" <-=== Mapping (testing) ===->
" :NERDTreeToggleVCS
" let g:fzf_tags_command = 'ctags -R'
nnoremap <F8> :TagbarToggle<CR>
nnoremap <C-g> :TagbarToggle<CR>

" NOTES: for new line with date
nmap <leader>o o\| date<tab> \| <esc>
nnoremap ZZ :bd<CR>


" function s:test(lines)
"     echo a:lines
" endfunction

" let g:fzf_action = {
"   \ 'ctrl-q': function('s:test'),
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" TODO
" markdown c-n tabnew edit {datetime}.md
" file rename
"
" https://github.com/Shougo/dein.vim
" ProsessionClean
" ProsessionDelete : add to fzf sessions call bind
imap <C-l> <C-x><C-f>
" :h key-notation

" FIX:
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
" imap <c-x><c-f> <plug>(fzf-complete-path)
"nnoremap <leader>b :BufExplorer<CR>

" NOTE: not used
"nmap <leader>f :set foldmethod=indent<CR>
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

