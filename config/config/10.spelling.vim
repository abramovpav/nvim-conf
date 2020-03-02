augroup SpellingUpdateGroup
	autocmd!
	autocmd InsertLeave * SpellingUpdate
	autocmd BufWrite * SpellingUpdate
	autocmd BufEnter * SpellingUpdate
	autocmd WinEnter * SpellingUpdate
augroup END
" let g:aspell_cmd = "aspell --mode=none --ignore=2 --byte-offsets --dont-backup --dont-suggest --run-together --run-together-limit=1000 --run-together-min=3 -a"
" let g:spelling_enabled = 0
" highlight link SpellingError SpellBad
" autocmd ColorScheme * highlight SpellingError cterm=underline gui=underline ctermfg=243 guifg=#727272

autocmd ColorScheme * highlight SpellBad cterm=underline gui=underline ctermfg=243 guifg=#727272

" let g:aspell_error_symbols = ['?', '#']
" let g:aspell_special_characters = ['*', '&', '@', '+', '-', '\~', '#', '!', '%', '\^']
" let s:aspell_special_characters_pattern = join(g:aspell_special_characters, '\|')
" 
" function! SpellingGetMisspelledWord()
"     let l:result = ''
"     let l:line = line('.')
"     let l:column = col('.')
"     for l:match in getmatches()
"         let l:match_line = l:match.pos1[0]
"         let l:match_column_start = l:match.pos1[1]
"         let l:match_column_end = l:match_column_start + l:match.pos1[2] - 1
"         if l:match.group == 'SpellingError' &&
"             \   l:match_line == l:line &&
"             \   l:column >= l:match_column_start &&
"             \   l:column <= l:match_column_end
"             let l:result = getline('.')[l:match_column_start - 1: l:match_column_end - 1]
"         endif
"     endfor
"     return l:result
" endfunction
" 
" function! SpellingSplit(str)
"     let l:results = []
"     call substitute(
"     \   a:str,
"     \   '\v\C[[:lower:],[:upper:]][[:lower:]]+|[[:upper:]]+([[:lower:]]@!)',
"     \   '\=add(l:results, submatch(0))',
"     \   'g'
"     \)
"     return l:results
" endfunction
" 
" function! SpellingGetBufferText()
"     let l:results = []
"     for l:line in getline(1, '$')
"         if empty(l:line)
"             let l:line = ' '
"         else
"             let l:line = substitute(
"             \   l:line, s:aspell_special_characters_pattern,
"             \   " ",
"             \   "g"
"             \)
"         endif
"         call add(l:results, l:line)
"     endfor
"     return join(l:results, "\n")
" endfunction
" 
" function! SpellingGetRunTogetherDataText(data)
"     let l:results = []
"     for l:item in a:data
"         call add(l:results, join(l:item.words, ' '))
"     endfor
"     return join(l:results, "\n")
" endfunction
" 
" function! SpellingGetErrorData(str)
"     let l:error = split(
"     \   split(
"     \       a:str, ":"
"     \   )[0]
"     \   , " "
"     \)
"     let l:word = l:error[1]
"     let l:result = {
"     \   'word': l:word,
"     \   'word_length': strlen(l:word),
"     \   'column_number': str2nr(l:error[-1])
"     \}
"     return l:result
" endfunction
" 
" function SpellingGetData()
"     let l:results = []
"     let l:run_together_words_data = []
"     let l:file_name = expand("%")
" 
"     let l:line_number = 0
"     for l:str in systemlist(g:aspell_cmd, SpellingGetBufferText())[1:]
"         if index(g:aspell_error_symbols, l:str[0]) >= 0
"             let l:error_data = SpellingGetErrorData(l:str)
"             let l:run_together_words = SpellingSplit(l:error_data.word)
"             if len(l:run_together_words) == 1
"                 call add(
"                 \   l:results,
"                 \   {
"                 \       'word': l:error_data.word,
"                 \       'word_length': l:error_data.word_length,
"                 \       'column_number': l:error_data.column_number + 1,
"                 \       'line_number': l:line_number + 1,
"                 \       'file_name': l:file_name,
"                 \   }
"                 \)
"             else
"                 call add(
"                 \   l:run_together_words_data,
"                 \   {
"                 \       'words': l:run_together_words,
"                 \       'line_number': l:line_number,
"                 \       'column_number': l:error_data.column_number,
"                 \   }
"                 \)
"             endif
"         endif
"         if empty(l:str)
"             let l:line_number += 1
"         endif
"     endfor
" 
"     let l:line_number = 0
"     let l:run_together_words_count = 0
"     for l:str in systemlist(
"         \       g:aspell_cmd,
"         \       SpellingGetRunTogetherDataText(l:run_together_words_data)
"         \)[1:]
"         if index(g:aspell_error_symbols, l:str[0]) >= 0
"             let l:error_data = SpellingGetErrorData(l:str)
"             let l:run_together_word_data = l:run_together_words_data[l:line_number]
"             call add(
"             \   l:results,
"             \   {
"             \       'word': l:error_data.word,
"             \       'word_length': l:error_data.word_length,
"             \       'column_number': l:error_data.column_number +
"             \           l:run_together_word_data.column_number -
"             \           l:run_together_words_count + 1,
"             \       'line_number': l:run_together_word_data.line_number + 1,
"             \       'file_name': l:file_name,
"             \   }
"             \)
"         endif
"         let l:run_together_words_count += 1
"         if empty(l:str)
"             let l:line_number += 1
"             let l:run_together_words_count = 0
"         endif
"     endfor
"     return l:results
" endfunction
" 
" function! SpellingFill()
"     for l:item in SpellingGetData()
"         call matchaddpos(
"         \   'SpellingError',
"         \   [
"         \       [
"         \           l:item.line_number,
"         \           l:item.column_number,
"         \           l:item.word_length,
"         \       ]
"         \   ]
"         \)
"     endfor
" endfunction
" 
" function! SpellingClear()
"     for l:match in getmatches()
"         if l:match.group == 'SpellingError'
"             call matchdelete(l:match.id)
"         endif
"     endfor
" endfunction
" 
" function! SpellingUpdate()
"     if g:spelling_enabled && !&readonly && !empty(&filetype)
"         call SpellingClear()
"         call SpellingFill()
"     endif
" endfunction
" 
" function! SpellingToggle()
"     if g:spelling_enabled
"         let g:spelling_enabled = 0
"         call SpellingClear()
"     else
"         let g:spelling_enabled = 1
"         call SpellingFill()
"     endif
" endfunction
" 
" function! SpellingAddWord()
"     let l:word = SpellingGetMisspelledWord()
"     if !empty(l:word)
"         call system('echo -e "*' . l:word . '\n#" | aspell -a')
"         call SpellingUpdate()
"         echo 'Spelling: word "' . l:word . '" successfully added.'
"     else
"         echo 'Spelling: no misspelled word found'
"     endif
" endfunction
" 
" let g:neomake_spelling_maker = {'name': 'spelling'}
" function! g:neomake_spelling_maker.get_list_entries(jobinfo) abort
"     let l:results = []
"     for l:item in SpellingGetData()
"         call add(
"         \   l:results,
"         \   {
"         \       'text': l:item.word,
"         \       'lnum': l:item.line_number,
"         \       'col': l:item.column_number,
"         \       'length': l:item.word_length,
"         \       'filename': l:item.file_name,
"         \       'type': 'I',
"         \   },
"         \)
"     endfor
"     return l:results
" endfunction
" 
" command! SpellingAddWord call SpellingAddWord()
" command! SpellingToggle call SpellingToggle()
" 
" 
" " SPELLING
" augroup SpellingBufferGroup
"     autocmd!
"     autocmd BufAdd * call SpellingUpdate()
"     autocmd BufWrite * call SpellingUpdate()
"     autocmd CursorHold * call SpellingUpdate()
" augroup END
