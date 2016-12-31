" Unicode Strikeout text motion action
function! Strikeout(str)
	return substitute(a:str, '\w', "\&\u0336", 'g')
endfunction

call MapAction('Strikeout', '<Leader>s')
