let &t_ut=''
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:loaded_python_provider = 1
let g:loaded_python3_provider = 1

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_set_statusline = 1
let g:ale_set_highlights = 1
let g:ale_virtualtext_cursor = 1

let g:airline_section_z = '%3p%% %3l:%2c'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \}
let g:vimtex_quickfix_mode = 0
let g:vimtex_main_file = 'main.tex'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1
let g:lsp_completion_trigger_character_enabled = 1
let g:lsp_completion_trigger_characters = ['\', '{', ',']
let g:lsp_text_edit_enabled = 1
let g:lsp_insert_text_enabled = 1
let g:lsp_auto_enable = 1
let g:lsp_completion_resolve_timeout = 500
let g:lsp_async_completion = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_file_force_refresh = 1
