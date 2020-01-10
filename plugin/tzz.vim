function! GetCursorChar()
	echo "in"
	let index = col(".")
	let l = line(".")
	let lastChar =getline(".")[index-2]
	if lastChar == "("
		call cursor(l,index+1)
	else
		exec 'normal! i)'
		call cursor(l,index+1)
	endif
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
	
