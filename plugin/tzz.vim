""function! MoveIfLeftParenthese()
""	let index = col(".")
""	let l = line(".")
""	let lastChar =getline(".")[index-2]
""	if lastChar == "("
""		call cursor(l,index+1)
""	else
""		exec 'normal! i)'
""		call cursor(l,index+1)
""	endif
""endfunction

function TzzLineIndex()
    return line(".")
endfunction

function TzzColIndex()
    return col(".")
endfunction

function! MoveIfLeftParenthese()
    let l =TzzLineIndex()
    let index = TzzColIndex()
    if TzzGetPreviousChar() == "("
		call cursor(l,index+1)
	else
		exec 'normal! i)'
		call cursor(l,index+1)
	endif
endfunction

function! TzzGetPreviousChar()
	let index = col(".")
	let l = line(".")
	let lastChar =getline(".")[index-2]
    return lastChar
endfunction

function! TzzGetNextChar()
	let index = col(".")
	let l = line(".")
	let next =getline(".")[index-1]
    return next
endfunction

function! TzzcdFile()
	let  curFilename = TzzGetCurFilename()
	let path = TzzBasePath(curFilename)
	if path !=""
		exec "tcd" path
	endif
endfunction

function! TzzGetCurFilename()
	let filename = @%
	return filename
endfunction

function! TzzBasePath(path)
	echo a:path
	let index = strridx(a:path,"/")
	if index != -1
		return a:path[:index]
	endif
	return ""
endfunction
	


function! Tzz_IsInBraceMiddle()
    if TzzGetPreviousChar() == "{" && TzzGetNextChar() == "}"
        return 1
    endif
    return 0
endfunction

function! TzzEnter()
    if Tzz_IsInBraceMiddle()
        call feedkeys("\<cr>\<esc>\<s-o>","n")
        ""normal! <s-o>
    else
        call  feedkeys("\<cr>","n")
    endif
endfunction
