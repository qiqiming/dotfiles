
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

