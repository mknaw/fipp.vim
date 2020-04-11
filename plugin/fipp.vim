" fipp.vim - Find in Python Package
" Author: Matt Nawara

if get(g:, 'loaded_fipp', 0)
    finish
endif
let g:loaded_fipp = 1

command! -nargs=+ Fipp call fipp#Fipp(<f-args>)

fu! fipp#Fipp(searchterm, package)
    let package_dir = $VIRTUAL_ENV . '/lib/'
    let package_dir = split(globpath(package_dir, '*'), '\n')[0] . '/site-packages/'
    execute 'Ag ' . a:searchterm . ' ' . package_dir . a:package
endfunction

let g:loaded_far = 0

