" fipp.vim - Find in Python Package
" Author: mknaw

if get(g:, 'loaded_fipp', 0)
  finish
endif
let g:loaded_fipp = 1

command! -nargs=+ Fipp call fipp#Fipp(<q-args>)

fu! fipp#Fipp(args)
  if !exists('g:loaded_ack')
    echoe "Must have ack package loaded"
  endif

  let l:pypackage_dir = $VIRTUAL_ENV . '/lib/'
  " Pulls the first folder available in `/lib/`
  " could TODO this more gracefully
  let l:pypackage_dir = split(globpath(l:pypackage_dir, '*'), '\n')[0] . '/site-packages/'

  let l:args = split(a:args, ' ')
  let l:searchargs = l:args[:-2]
  let l:pypackage = l:args[-1]

  execute 'Ack ' . join(l:searchargs) . ' ' . l:pypackage_dir . l:pypackage
endfunction

let g:loaded_fipp = 0

