let g:startify_session_dir = '~/.config/nvim/session'


let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]


let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/Code',
            \ ]


let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0


# let g:startify_custom_header = [
#     \                                                                                  
#     \ 'KKKKKKKKK    KKKKKKK                                   lllllll                   ',
#     \ 'K:::::::K    K:::::K                                   l:::::l                   ',
#     \ 'K:::::::K    K:::::K                                   l:::::l                   ',
#     \ 'K:::::::K   K::::::K                                   l:::::l                   ',
#     \ 'KK::::::K  K:::::KKK   ooooooooooo     aaaaaaaaaaaaa    l::::l   aaaaaaaaaaaaa   ',
#     \ '  K:::::K K:::::K    oo:::::::::::oo   a::::::::::::a   l::::l   a::::::::::::a  ',
#     \ '  K::::::K:::::K    o:::::::::::::::o  aaaaaaaaa:::::a  l::::l   aaaaaaaaa:::::a ',
#     \ '  K:::::::::::K     o:::::ooooo:::::o           a::::a  l::::l            a::::a ',
#     \ '  K:::::::::::K     o::::o     o::::o    aaaaaaa:::::a  l::::l     aaaaaaa:::::a ',
#     \ '  K::::::K:::::K    o::::o     o::::o  aa::::::::::::a  l::::l   aa::::::::::::a ',
#     \ '  K:::::K K:::::K   o::::o     o::::o a::::aaaa::::::a  l::::l  a::::aaaa::::::a ',
#     \ 'KK::::::K  K:::::KKKo::::o     o::::oa::::a    a:::::a  l::::l a::::a    a:::::a ',
#     \ 'K:::::::K   K::::::Ko:::::ooooo:::::oa::::a    a:::::a l::::::la::::a    a:::::a ',
#     \ 'K:::::::K    K:::::Ko:::::::::::::::oa:::::aaaa::::::a l::::::la:::::aaaa::::::a ',
#     \ 'K:::::::K    K:::::K oo:::::::::::oo  a::::::::::aa:::al::::::l a::::::::::aa:::a',
#     \ 'KKKKKKKKK    KKKKKKK   ooooooooooo     aaaaaaaaaa  aaaallllllll  aaaaaaaaaa  aaaa',
#   \ ]
