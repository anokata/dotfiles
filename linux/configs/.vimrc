" Remember use: marks, S, C-m
" [] [[ [{ ][ ]]
" daw vaw
" usefull bindings not used:  = - space bs Bind C-Fx S-Fx (F1-F12)
 
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
" https://github.com/junegunn/fzf.vim#commands
" nnoremap <localleader><Esc> :Maps<CR>
" nnoremap <leader><Tab> :<CR>
" nnoremap -
" nnoremap =
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
nnoremap <BS> :RnvimrToggle<CR>
" let g:NERDTreeHijackNetrw = 0
" let g:ranger_replace_netrw = 1
" :NERDTreeToggleVCS
" help terminal-configuration
" let g:XkbSwitchLib = "/usr/local/lib/libxkbswitch.so"
" let g:XkbSwitchEnabled = 1
" let g:XkbSwitchIMappings = ['ru']
" echo libcall(g:XkbSwitchLib, 'Xkb_Switch_getXkbLayout', '')
" call libcall(g:XkbSwitchLib, 'Xkb_Switch_setXkbLayout', 'us')
nnoremap <C-S-F1> :Prosession $DOTFILES_CONFIGS<CR>
nnoremap <C-S-F2> :Prosession $DOTFILES<CR>
nnoremap <C-S-F3> :Prosession $NOTES_DIR<CR>
nnoremap <C-S-F4> :Prosession $WORK_DIR_CURRENT<CR>
nnoremap <C-S-F5> :Prosession $VIM_DIR_CONFIGS<CR>

" let g:fzf_tags_command = 'ctags -R'
" <-=== Mapping (testing) ===->
" FIX:
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
" imap <c-x><c-f> <plug>(fzf-complete-path)
"nnoremap <leader>b :BufExplorer<CR>

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

