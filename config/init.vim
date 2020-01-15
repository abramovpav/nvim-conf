for f in sort(split(glob('~/.config/nvim/config/*.vim'), '\n'))
    exe 'source' f
endfor
