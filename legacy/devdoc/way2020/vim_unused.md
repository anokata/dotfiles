" vim: set syntax=vim:

" logger
let @p='0fpcwlogger.debug(ЂkDЂkDA)'
" log
let @l='0wdwilog.info(A)'
let @j='A {' {}
map <leader>k A {
" swap args in ()
let @w='0f(ldt,f)pui, p0f,dw'
" Java try 
let @t="Iclass :put =expand('%:t:r')A {lxkJopublic static void main(String[] args) {}}"
let @t="Itry {lxo} catch (Exception ex) { ex.printStackTrace(); }"

" temporary macros. for rainlin
let @m='/\<mdxExpertReportLink"f,a "exportFormats":["PDF","DOC","XLS","CSV","XML","PPT","ODT","ODS","ODP","DOCX","XLSX","PPTX"],":w'
let @n='/"WebReports.Controls.Report"bbbi"exportFormats":["PDF","DOC","XLS","CSV","XML","PPT","ODT","ODS","ODP","DOCX","XLSX","PPTX"],":w'


" fold all zm zr
"nnoremap <leader>g :exe 'W3m google ' . expand('<cword>')<CR>
