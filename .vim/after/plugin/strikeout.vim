" Unicode Strikeout text motion action
function! Strikeout(str)
	return substitute(a:str, '.', "\&\u0336", 'g')
endfunction

call MapAction('Strikeout', '<Leader>s')

function! UnStrikeout(str)
	let l:out = ""
	for x in split(a:str, '\zs')
		if (x =~ "\u0336")
			let x = nr2char(char2nr(x))
		endif
		let l:out .= x
	endfor
	return out
endfunction

call MapAction('UnStrikeout', '<Leader>S')
