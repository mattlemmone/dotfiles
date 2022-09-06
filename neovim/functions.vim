function! YarnTest()
  let currentFile=expand("%")
  execute 'vertical terminal yarn test ' . currentFile . ' | grep "PASS|\FAIL"'
  nmap <buffer> <ENTER> :bd!<CR>
endfunction
