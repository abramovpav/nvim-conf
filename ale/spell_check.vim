function! ale_linters#python#spell_check#Handle(buffer, lines) abort
    let l:pattern = '\v^(\S*):(\d*):(\d*):(.*)$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        let l:item = {
        \   'lnum': l:match[2] + 0,
        \   'col': l:match[3] + 0,
        \   'type': 'I',
        \   'text': l:match[4],
        \   'code': 'Spelling',
        \}
        call add(l:output, l:item)
    endfor

    return l:output
endfunction


call ale#linter#Define('python', {
\   'name': 'spell_check',
\   'executable': 'spelling',
\   'command': 'spelling %t',
\   'callback': 'ale_linters#python#spell_check#Handle',
\})
