" Settings
" g:pdb_debugger
" g:pdb_docker_compose_params
" g:pdb_docker_compose_service_name
" g:pdb_docker_container_name
" g:pdb_django_settings
" g:pdb_django_runserver_params
" g:pdb_django_runserver_addrport

func! s:get_option(key, ...)
    if has_key(g:, a:key)
        let l:result = get(g:, a:key)
    else
        let l:result = get(a:, 1, '')
    endif
    return !empty(l:result) ? ' ' . l:result : l:result
endfunc

func! s:get_django_settings_option()
    let l:key = 'pdb_django_settings'
    if has_key(g:, l:key)
        return ' --settings=' . get(g:, l:key)
    else
        return ''
    end
endfunc

let s:kill_django_server_cmd = 'pkill -9 -f "manage.py runserver"'
let s:docker_kill_django_server_cmd = {-> 'docker exec ' . g:pdb_docker_container_name . ' ' . s:kill_django_server_cmd}

let s:docker_compose_up_cmd = {-> 'docker-compose' . s:get_option('pdb_docker_compose_params') . ' up -d ' . g:pdb_docker_compose_service_name}

let s:cmd = {-> 'python -m' . s:get_option('pdb_debugger', 'pdb') . ' %s'}
let s:script_cmd = {-> s:cmd() . ' %s'}
let s:django_script_cmd = {-> s:cmd() . ' manage.py runscript' . s:get_django_settings_option() . ' %s'}
let s:django_server_cmd = {-> s:cmd() . ' manage.py runserver' . s:get_option('pdb_django_runserver_addrport') . s:get_django_settings_option() . s:get_option('pdb_django_runserver_params')}

let s:docker_cmd = {-> 'docker exec -it ' . g:pdb_docker_container_name}
let s:docker_script_cmd = {-> s:docker_cmd() . ' ' . s:script_cmd()}
let s:docker_django_script_cmd = {-> s:docker_cmd() . ' ' . s:django_script_cmd()}
let s:docker_django_server_cmd = {-> s:docker_cmd() . ' ' . s:django_server_cmd()}

func! PDBGetBreakpoint(file_name, line_number)
    let l:file_name = empty(a:file_name) ? GetCurrentFileName() : a:file_name
    let l:line_number = empty(a:line_number) ? line('.') : a:line_number
    let l:result = 'b ' .
        \ l:file_name . ':' .
        \ l:line_number
    return l:result
endfunc

func! s:get_breakpoints()
    let l:results = []
    for [l:file_name, l:line_numbers] in items(g:breakpoints_data)
        for l:line_number in l:line_numbers
            call add(l:results, '-c ' . '"' . PDBGetBreakpoint(l:file_name, l:line_number) . '"')
        endfor
    endfor
    if !empty(l:results)
        call add(l:results, '-c "c"')
    endif
    return join(l:results)
endfunc

func! s:get_current_file_name()
    return fnamemodify(expand("%"), ":~:.")
endfunc

func! s:get_current_django_script_name()
    return join(split(expand('%:r'), '/'), '.')
endfunc

func! s:run(cmd, mode, name)
    echom a:cmd
    execute(empty(a:mode) ? 'vsp' : a:mode)
    execute('term ' . a:cmd)
    execute('file ' . s:get_option('pdb_debugger', 'pdb') . ': ' . a:name . ' ' . bufnr())
    redraw
endfunc

func! s:docker_compose_up()
    if has_key(g:, 'pdb_docker_compose_service_name')
        call system(s:docker_compose_up_cmd())
    endif
endfunc

func! s:kill_django_server()
    call system(s:kill_django_server_cmd)
endfunc

func! s:docker_kill_django_server()
    call system(s:docker_kill_django_server_cmd())
endfunc

func! s:run_script(mode)
    let l:cmd = printf(s:script_cmd(), s:get_breakpoints(), s:get_current_file_name())
    call s:run(l:cmd, a:mode, expand('%:t'))
endfunc

func! s:run_django_script(mode)
    let l:cmd = printf(s:django_script_cmd(), s:get_breakpoints(), s:get_current_django_script_name())
    call s:run(l:cmd, a:mode, expand('%:t'))
endfunc

func! s:run_django_server(mode)
    call s:kill_django_server()
    let l:cmd = printf(s:django_server_cmd(), s:get_breakpoints())
    call s:run(l:cmd, a:mode, 'django runserver')
endfunc

func! s:run_docker_script(mode)
    call s:docker_compose_up()
    let l:cmd = printf(s:docker_script_cmd(), s:get_breakpoints(), s:get_current_file_name())
    call s:run(l:cmd, a:mode, expand('%:t'))
endfunc

func! s:run_docker_django_script(mode)
    call s:docker_compose_up()
    let l:cmd = printf(s:docker_django_script_cmd(), s:get_breakpoints(), s:get_current_django_script_name())
    call s:run(l:cmd, a:mode, expand('%:t'))
endfunc

func! s:run_docker_django_server(mode)
    call s:docker_compose_up()
    call s:docker_kill_django_server()
    let l:cmd = printf(s:docker_django_server_cmd(), s:get_breakpoints())
    call s:run(l:cmd, a:mode, 'django runserver')
endfunc

command! -nargs=? PDBRunScript call s:run_script(<q-args>)
command! -nargs=? PDBRunDjangoScript call s:run_django_script(<q-args>)
command! -nargs=? PDBRunDjangoServer call s:run_django_server(<q-args>)
command! -nargs=? PDBRunDockerScript call s:run_docker_script(<q-args>)
command! -nargs=? PDBRunDockerDjangoScript call s:run_docker_django_script(<q-args>)
command! -nargs=? PDBRunDockerDjangoServer call s:run_docker_django_server(<q-args>)
