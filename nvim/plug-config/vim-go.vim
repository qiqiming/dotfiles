
autocmd BufWritePre *.go silent! call CocAction('runCommand', 'editor.action.organizeImport')
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
" disable vim-go: GoDoc short cut (K)
" this is handled by LanguageClient [LC]
let g:go_doc_keywordprg_enabled = 0


" highlight
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1

let g:go_code_completion_enabled = 0
let g:go_fmt_autosave = 0
let g:go_imports_autosave = 0
let g:go_mod_fmt_autosave = 0
let g:go_textobj_enabled = 0
