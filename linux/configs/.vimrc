" Remember use: marks, S, C-m
" [] [[ [{ ][ ]]
" daw vaw
 
" === Load configs === (<localleader>c* to open)
source ~/.vim/config/plugins
source ~/.vim/config/settings
source ~/.vim/config/bindings
" TODO:
" source ~/.vim/config/plugin-bindings
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

nnoremap <F5> :!cliptw<CR>


nnoremap ZZ :bd<CR>
nnoremap <S-u> <C-r>

" Coc config
" https://github.com/neoclide/coc-eslint
"https://github.com/neoclide/coc-prettier
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"   let g:coc_global_extensions += ['coc-eslint']
" endif
" 
nnoremap <silent> <leader>K :call CocAction('doHover')<CR>
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

set updatetime=300
set shortmess+=c

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>cl  <Plug>(coc-codelens-action)

" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

function! CocToggle()
    if g:coc_enabled
        CocDisable
    else
        CocEnable
    endif
endfunction
" command! CocToggle :call CocToggle()

" Tig
" open tig with current file
nnoremap <Leader>gT :TigOpenCurrentFile<CR>
" open tig with Project root path
nnoremap <Leader>gt :TigOpenProjectRootDir<CR>
nnoremap <C-k> :TigOpenProjectRootDir<CR>
" open tig grep
nnoremap <Leader>gg :TigGrep<CR>
" resume from last grep
nnoremap <Leader>gr :TigGrepResume<CR>
" open tig grep with the selected word
" vnoremap <Leader>g y:TigGrep<Space><C-R>"<CR>
" open tig grep with the word under the cursor
nnoremap <Leader>gc :<C-u>:TigGrep<Space><C-R><C-W><CR>
" open tig blame with current file
nnoremap <Leader>bb :TigBlame<CR>
nnoremap <Leader>gp :Git -c push.default=current push
" git push origin $(git branch --show-current)
"CocRestart

" TSEnable highlight 
" TSEnable ident
" autocmd VimEnter * TSEnable highlight .

" TODO
" autocmd FileType scss setl iskeyword+=@-@

" noremap <leader>b :execute "!git blame -L " . eval(line(".")-5) . ",+10 %"<cr>
" let g:blameLineUseVirtualText = 0

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
nmap <C-_> gcc
vmap <C-_> gcc
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
