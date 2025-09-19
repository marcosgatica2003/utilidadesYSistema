au User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': ['clangd'],
    \ 'whitelist': ['c', 'cpp'],
    \ })
au User lsp_setup call lsp#register_server({
    \ 'name': 'pylsp',
    \ 'cmd': ['pylsp'],
    \ 'whitelist': ['python'],
    \ })
au User lsp_setup call lsp#register_server({
    \ 'name': 'digestif',
    \ 'cmd': {server_info->['digestif']},
    \ 'allowlist': ['tex', 'plaintex', 'bib'],
    \ })
