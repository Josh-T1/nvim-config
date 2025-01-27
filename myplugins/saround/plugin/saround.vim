" Include user function to add more sarround types, ie quotes
let g:sarround_options = { 'round': ['(', ')'], "curly": ['{', '}'], 'square': ['[',']'], 
            \ 'quote': ['"', '"'], 'math': ['\(', '\)'], 
            \ 'underbrace': ['\underbrace{', '}'] }
" DOes this EveN WoRk
if exists('g:sarround_options_user')
	let g:sarround_options = extendnew(g:sarround_options, g:sarround_options_user)
endif

if exists('g:saround_curly_user_keys')
	let g:saround_curly_keys = g:saround_curly_user_keys
else
	let g:saround_curly_keys = "ssc"
endif

if exists('g:saround_square_user_keys')
	let g:saround_square_keys = g:saround_square_user_keys
else
	let g:saround_square_keys = "sss"
endif

if exists('g:saround_round_user_keys')
	let g:saround_round_keys = g:saround_round_user_keys
else
	let g:saround_round_keys = "ssr"
endif

if exists('g:saround_quote_user_keys')
	let g:saround_quote_keys = g:saround_quote_user_keys
else
	let g:saround_quote_keys = 'ssq'
endif

if exists('g:saround_math_user_keys')
	let g:saround_math_keys = g:saround_math_user_keys
else
	let g:saround_math_keys = 'ssm'
endif
"extendnew(defaults, override)
function! Saround(bracket_type) abort
	"Assumes info to saround with brakets is contained in 0 register
	"Also assumes '^@' needs to be trimmed from string
	let res = substitute(@p, '\n*$', '', '')	 "[[:cntrl:]]
	let brackets = get(g:sarround_options, a:bracket_type, ['(', ')'])
	let string =  brackets[0] .res. brackets[1]
	"number of non empty characters afer cursor, i doubt this works
	let end_of_line = strchars(substitute(getline('.')[col('.')-1:], " ", '', ""))
	"return string
	if(end_of_line > 0)
		let cmd = "i\<c-r>='" .string. "'\<cr>"
	else
		let cmd = "a\<c-r>='" .string. "'\<cr>"
	endif
	execute 'normal! '.cmd
endfunction


"Add tabstop option for options
command! SaroundCurly :call Saround('curly')
command! SaroundSquare :call Saround('square')
command! SaroundRound :call Saround('round')
command! SaroundQuote :call Saround('quote')
command! SaroundMath :call Saround('math')
" <C-U> removes visual selection '<,'>
execute 'vnoremap '.g:saround_curly_keys.' "pc<c-o>:SaroundCurly<cr>'
execute 'vnoremap '.g:saround_square_keys.' "pc<c-o>:SaroundSquare<cr>'
execute 'vnoremap '.g:saround_round_keys.' "pc<c-o>:SaroundRound<cr>'
execute 'vnoremap '.g:saround_quote_keys.' "pc<c-o>:SaroundQuote<cr>'
execute 'vnoremap '.g:saround_math_keys.' "pc<c-o>:SaroundMath<cr>'
" allow for tab between different bracket types
" tab to get selection for cut
" extend into visual mode
" would it be possible to have a function for custom saround_curly_user_keys
" ie add math mode around text, no shortucut just add field to function
"
function! ListBrakets()
	call complete(col('.'), ['()', '[]', '{}',])
	return ''
endfunction

function! Peek() abort
	if(v:completed_item == {})	
		return ''
	else
		return v:completed_item['word']
	endif
endfunction


" ------------ BUGS ------------------
" if  the word contains open brackets there are issures - could explore using
" paste (in commentoutfile)
" This may only work for one lineers
