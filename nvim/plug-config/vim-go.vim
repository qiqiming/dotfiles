
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
" disable vim-go: GoDoc sho cut (K)
" this is handled by LanguageClient [LC]
let g:go_doc_keywordprg_enabled = 1


" highlight
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
