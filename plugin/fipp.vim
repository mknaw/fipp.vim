" fipp.vim - Find in Python Package
" Author: mknaw

if get(g:, 'loaded_fipp', 0)
  finish
endif
let g:loaded_fipp = 1

command! -nargs=+ Fipp call fipp#Fipp(<f-args>)

fu! fipp#Fipp(searchterm, package)
  if !exists('g:loaded_ack')
    echoe "Must have ack package loaded"
  endif
  let package_dir = $VIRTUAL_ENV . '/lib/'
  let package_dir = split(globpath(package_dir, '*'), '\n')[0] . '/site-packages/'
  execute 'Ack ' . a:searchterm . ' ' . package_dir . a:package
endfunction

let g:loaded_far = 0

