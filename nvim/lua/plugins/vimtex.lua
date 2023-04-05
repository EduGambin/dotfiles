return {
	'lervag/vimtex',
	ft = 'tex',
	config = function()
		vim.cmd([[
			let g:vimtex_view_general_viewer = 'SumatraPDF'
			let g:vimtex_view_general_options
			\ = '-reuse-instance -forward-search @tex @line @pdf'

			let g:vimtex_compiler_latexmk = {
				\ 'build_dir' : 'build',
				\}

			let g:vimtex_syntax_conceal = {
				\ 'accents': 1,
				\ 'ligatures': 1,
				\ 'cites': 1,
				\ 'fancy': 1,
				\ 'spacing': 1,
				\ 'greek': 1,
				\ 'math_bounds': 0,
				\ 'math_delimiters': 1,
				\ 'math_fracs': 1,
				\ 'math_super_sub': 1,
				\ 'math_symbols': 1,
				\ 'sections': 0,
				\ 'styles': 1,
				\}
			]])
	end
}
