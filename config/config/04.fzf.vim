command! -bang -nargs=* AgExact call fzf#vim#ag(<q-args>, '-Q', <bang>0)
command! -bang -nargs=* AgWords call fzf#vim#ag(<q-args>, '-Q -w', <bang>0)
command! -bang -nargs=* AgCs call fzf#vim#ag(<q-args>, '-s', <bang>0)
command! -bang -nargs=* AgCsExact call fzf#vim#ag(<q-args>, '-Q -s', <bang>0)
command! -bang -nargs=* AgCsWords call fzf#vim#ag(<q-args>, '-Q -w -s', <bang>0)
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
