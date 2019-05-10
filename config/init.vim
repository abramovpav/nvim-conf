let g:python3_host_prog = '/usr/local/bin/python'
let g:loaded_python_provider = 1

for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
    exe 'source' f
endfor
