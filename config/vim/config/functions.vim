function! FindAndCompileMainTex()
  silent write
  
  let current_dir = getcwd()
  
  let main_file = findfile("main.tex", ".;")
  
  if !empty(main_file)
    echo "Compilando main.tex..."
    execute "VimtexCompile " . main_file
  else
    echo "No se encontró main.tex. Compilando archivo actual..."
    VimtexCompile
  endif
endfunction

