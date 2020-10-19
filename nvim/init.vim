call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Yggdroot/indentLine'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'dracula/vim', {'as': 'dracula'}
Plug 'altercation/vim-colors-solarized'
Plug 'flrnprz/plastic.vim'
Plug 'liuchengxu/vista.vim'
Plug 'voldikss/vim-floaterm'
" Plug 'jiangmiao/auto-pairs'
call plug#end()

" defx 
call defx#custom#option('_', {
      \ 'winwidth': 45,
      \ 'columns': 'mark:indent:icon:icons:filename:git',
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 1,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ 'root_marker': ':',
      \ })

set conceallevel=2
set concealcursor=nc
map <silent> - :Defx<cr>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  IndentLinesDisable
  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> <CR> defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('drop')
  nnoremap <silent><buffer><expr> l defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('drop')
  nnoremap <silent><buffer><expr> h defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> S defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <Tab> <SID>defx_toggle_zoom()

endfunction

function s:defx_toggle_zoom() abort "{{{
  let b:DefxOldWindowSize = get(b:, 'DefxOldWindowSize', winwidth('%'))
  let size = b:DefxOldWindowSize
  if exists("b:DefxZoomed") && b:DefxZoomed
      exec "silent vertical resize ". size
      let b:DefxZoomed = 0
  else
      exec "vertical resize ". get(g:, 'DefxWinSizeMax', '')
      let b:DefxZoomed = 1
  endif
endfunction "}}}

let g:defx_git#show_ignored = 0
let g:defx_git#column_length = 1

hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment


let g:defx_icons_parent_icon = ""
let g:defx_icons_mark_icon = ''
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 1
let g:defx_icons_mark_icon = '*'
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_directory_icon = ''
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''


"  }}}


autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')


set nu
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noswapfile
set nobackup
set smartcase
set undodir=~/.vim/undodir
set undofile

set background=dark
syntax on
colorscheme plastic
let g:lightline = { 'colorscheme': 'plastic' }


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline_theme="solarized"
let g:airline_solarized_bg="dark"

" buffer快速导航
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>bd :bd<CR>

" 查看buffers
nnoremap <Leader>l :ls<CR>

" 通过索引快速跳转
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
     \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" :set list lcs=tab:\|\ (here is a space).
set list lcs=tab:\┊\ 

let g:startify_custom_header = [
    \                                                                                  
    \ 'KKKKKKKKK    KKKKKKK                                   lllllll                   ',
    \ 'K:::::::K    K:::::K                                   l:::::l                   ',
    \ 'K:::::::K    K:::::K                                   l:::::l                   ',
    \ 'K:::::::K   K::::::K                                   l:::::l                   ',
    \ 'KK::::::K  K:::::KKK   ooooooooooo     aaaaaaaaaaaaa    l::::l   aaaaaaaaaaaaa   ',
    \ '  K:::::K K:::::K    oo:::::::::::oo   a::::::::::::a   l::::l   a::::::::::::a  ',
    \ '  K::::::K:::::K    o:::::::::::::::o  aaaaaaaaa:::::a  l::::l   aaaaaaaaa:::::a ',
    \ '  K:::::::::::K     o:::::ooooo:::::o           a::::a  l::::l            a::::a ',
    \ '  K:::::::::::K     o::::o     o::::o    aaaaaaa:::::a  l::::l     aaaaaaa:::::a ',
    \ '  K::::::K:::::K    o::::o     o::::o  aa::::::::::::a  l::::l   aa::::::::::::a ',
    \ '  K:::::K K:::::K   o::::o     o::::o a::::aaaa::::::a  l::::l  a::::aaaa::::::a ',
    \ 'KK::::::K  K:::::KKKo::::o     o::::oa::::a    a:::::a  l::::l a::::a    a:::::a ',
    \ 'K:::::::K   K::::::Ko:::::ooooo:::::oa::::a    a:::::a l::::::la::::a    a:::::a ',
    \ 'K:::::::K    K:::::Ko:::::::::::::::oa:::::aaaa::::::a l::::::la:::::aaaa::::::a ',
    \ 'K:::::::K    K:::::K oo:::::::::::oo  a::::::::::aa:::al::::::l a::::::::::aa:::a',
    \ 'KKKKKKKKK    KKKKKKK   ooooooooooo     aaaaaaaaaa  aaaallllllll  aaaaaaaaaa  aaaa',
  \ ]




let g:go_def_mapping_enabled = 0
