sign define Breakpoint text=-> texthl=WarningMsg

let g:breakpoints_file_name = '.breakpoints'
let g:breakpoints_data = {}

augroup BreakpointsBufferGroup
    autocmd!
    autocmd BufRead * call BreakpointsBufEnter()
    autocmd BufWrite * call BreakpointsBufWrite()
augroup END

function! BreakpointsBufEnter()
    call PlaceBreakpointSigns()
endfunction

function! BreakpointsBufWrite()
    call UpdateBreakpointsData()
    call SaveBreakpointsData()
endfunction

function! GetCurrentFileName()
    return fnamemodify(expand("%"), ":~:.")
endfunction

function! IsBreakpointSignExists(file_name, line_number)
    let l:file_name = empty(a:file_name) ? GetCurrentFileName() : a:file_name
    let l:line_number = empty(a:line_number) ? line('.') : a:line_number
    return !empty(sign_getplaced(l:file_name, {'group': 'Breakpoint', 'lnum': l:line_number})[0].signs)
endfunction

function! PlaceBreakpointSign(file_name, line_number)
    let l:file_name = empty(a:file_name) ? GetCurrentFileName() : a:file_name
    let l:line_number = empty(a:line_number) ? line('.') : a:line_number
    if !IsBreakpointSignExists(l:file_name, l:line_number)
        return sign_place(0, 'Breakpoint', 'Breakpoint', l:file_name, {'lnum': l:line_number, 'priority': 1000})
    endif
endfunction

function! PlaceBreakpointSigns()
    for [l:file_name, l:line_numbers] in items(g:breakpoints_data)
        if l:file_name == GetCurrentFileName()
            for l:line_number in l:line_numbers
                call PlaceBreakpointSign(l:file_name, l:line_number)
            endfor
        endif
    endfor
endfunction

function! UpdateBreakpointsData()
    let l:file_name = GetCurrentFileName()
    let l:line_numbers = []
    let l:lines_count = line('$')
    for l:sign_data in GetBreakpointSigns()
        if l:sign_data.lnum <= l:lines_count
            call add(l:line_numbers, l:sign_data.lnum)
        else
            call DeleteBreakpointSign(l:sign_data.lnum)
        endif
    endfor
    if !empty(l:line_numbers)
        let g:breakpoints_data[l:file_name] = l:line_numbers
    elseif has_key(g:breakpoints_data, l:file_name)
        call remove(g:breakpoints_data, l:file_name)
    endif
endfunction

function! GetBreakpointSigns()
    return sign_getplaced(GetCurrentFileName(), {'group': 'Breakpoint'})[0].signs
endfunction

function! DeleteBreakpointSign(line_number)
    let l:line_number = empty(a:line_number) ? line('.') : a:line_number
    let l:signs = sign_getplaced(GetCurrentFileName(), {'group': 'Breakpoint', 'lnum': l:line_number})[0].signs
    if !empty(l:signs)
        let l:sign = l:signs[0]
        call sign_unplace('Breakpoint', {'buffer': GetCurrentFileName(), 'id': l:sign.id})
    endif
endfunction

function! DeleteBufferBreakpountSigns()
    call sign_unplace('Breakpoint', {'buffer': GetCurrentFileName()})
endfunction

function! DeleteAllBreakpountSigns()
    call sign_unplace('Breakpoint')
endfunction

function! SaveBreakpointsData()
    call writefile([string(g:breakpoints_data)], g:breakpoints_file_name)
endfun

function! LoadBreakpointsData()
    if file_readable(g:breakpoints_file_name)
        let l:lines = readfile(g:breakpoints_file_name)
        if !empty(l:lines)
            execute "let g:breakpoints_data = " . l:lines[0]
        endif
    endif
endfun

function! UpdateBreakpointsQuickFix()
    let l:items = []
    for [l:file_name, l:line_numbers] in items(g:breakpoints_data)
        for l:line_number in l:line_numbers
            let l:item = {
                \ 'filename': fnamemodify(l:file_name, ':p'), 
                \ 'lnum': l:line_number, 
                \ 'text': '',
                \ }
            call add(l:items, l:item)
        endfor
    endfor
    call setqflist(l:items, 'r')
endfunction

function! AddBreakpoint()
    call PlaceBreakpointSign(v:null, v:null)
    call UpdateBreakpointsData()
    call UpdateBreakpointsQuickFix()
    call SaveBreakpointsData()
endfunction

function! DeleteBreakpoint()
    call DeleteBreakpointSign(v:null)
    call UpdateBreakpointsData()
    call UpdateBreakpointsQuickFix()
    call SaveBreakpointsData()
endfunction

function! DeleteBufferBreakpoints()
    call DeleteBufferBreakpountSigns()
    call UpdateBreakpointsData()
    call UpdateBreakpointsQuickFix()
    call SaveBreakpointsData()
endfunction

function! DeleteAllBreakpoints()
    call DeleteAllBreakpountSigns()
    let g:breakpoints_data = {}
    call UpdateBreakpointsQuickFix()
    call SaveBreakpointsData()
endfunction

function! ShowBreakpoints()
    call UpdateBreakpointsQuickFix()
    copen
endfunction

call LoadBreakpointsData()
