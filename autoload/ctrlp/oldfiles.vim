
if exists('g:loaded_ctrlp_oldfiles') && g:loaded_ctrlp_oldfiles
  finish
endif
let g:loaded_ctrlp_oldfiles = 1

let s:oldfiles_var = {
            \ 'init': 'ctrlp#oldfiles#init()',
            \ 'exit': 'ctrlp#oldfiles#exit()',
            \ 'accept': 'ctrlp#oldfiles#accept',
            \ 'lname': 'oldfiles',
            \ 'sname': 'oldfiles',
            \ 'type': 'path',
            \ 'sort': 0,
            \}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:oldfiles_var)
else
    let g:ctrlp_ext_vars = [s:oldfiles_var]
endif

function! ctrlp#oldfiles#init()
    return v:oldfiles
endfunc

function! ctrlp#oldfiles#accept(mode, str)
    call ctrlp#exit()
    cal ctrlp#acceptfile(a:mode, a:str)
endfunction

function! ctrlp#oldfiles#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#oldfiles#id()
    return s:id
endfunction
