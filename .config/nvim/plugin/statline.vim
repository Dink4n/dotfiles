function CheckMode() abort
    let l:m = mode(1)
    if l:m ==# "i"
      let l:mode = ['insert']
    elseif l:m[0] ==# "i"
      let l:mode = ['insert']
    elseif l:m ==# "Rv"
      let l:mode =['replace']
    elseif l:m[0] ==# "R"
      let l:mode = ['replace']
    elseif l:m[0] =~# '\v(v|V||s|S|)'
      let l:mode = ['visual']
    elseif l:m ==# "t"
      let l:mode = ['terminal']
    elseif l:m[0] ==# "c"
      let l:mode = ['cmd']
    elseif l:m ==# "no"   " does not work, most likely, Vim does not refresh the statusline in OP mode
      let l:mode = ['normal']
    elseif l:m[0:1] ==# 'ni'
      let l:mode = ['insert']
      let l:m = 'ni'
    else
      let l:mode = ['normal']
    endif

    let mode_string = join(l:mode)
    return mode_string
endfunction

" Left Side
set laststatus=2
set statusline=
set statusline+=%#keyword#
set statusline+=[%{toupper(CheckMode())}]
set statusline+=%0*
" Middle
set statusline+=%=
set statusline+=%F\ 
set statusline+=%m
" Right side
set statusline+=%=
set statusline+=%r
set statusline+=[%l\ :\ %L]\ 
set statusline+=%y
