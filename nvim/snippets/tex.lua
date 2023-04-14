-------------------------------------------------------------------------------
-- Summary: If `SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- If `SELECT_RAW` is empty, the function simply returns an empty insert node.
local VISUAL = function(args, parent)
	if (#parent.snippet.env.SELECT_RAW > 0) then
		return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
	else	-- If SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end
-------------------------------------------------------------------------------

local math_mode = function()
	--return vim.fn['vimtex#syntax#in_mathzone']() == 1
	return false
end

local text_mode = function()
	return not math_mode()
end

local b = require("luasnip.extras.expand_conditions").line_begin

local m = function(index)
	return f( function(_, snip) return snip.captures[index] end )
end

local fancy_wrap = function(match, short, long)
	if (string.len(match) == 1) then
		return '\\' .. short .. ' ' .. match
	else
		return '\\' .. long .. '{' .. match .. '}'
	end
end

local greek = {
	a = 'alpha',
	b = 'beta',
	g = 'gamma',
	d = 'delta',
	e = 'epsilon',
	z = 'zeta',
	h = 'eta',
	q = 'theta',
	i = 'iota',
	k = 'kappa',
	l = 'lambda',
	m = 'mu',
	n = 'nu',
	x = 'xi',
	o = 'omicron',
	p = 'pi',
	r = 'rho',
	s = 'sigma',
	t = 'tau',
	u = 'upsilon',
	f = 'phi',
	c = 'chi',
	y = 'psi',
	w = 'omega',
	A = 'Alpha',
	B = 'Beta',
	G = 'Gamma',
	D = 'Delta',
	E = 'Epsilon',
	Z = 'Zeta',
	H = 'Eta',
	Q = 'Theta',
	I = 'Iota',
	K = 'Kappa',
	L = 'Lambda',
	M = 'Mu',
	N = 'Nu',
	X = 'Xi',
	O = 'Omicron',
	P = 'Pi',
	R = 'Rho',
	S = 'Sigma',
	T = 'Tau',
	U = 'Upsilon',
	F = 'Phi',
	C = 'Chi',
	Y = 'Psi',
	W = 'Omega',
}

var_greek = {
	a = 'varalpha',
	b = 'varbeta',
	g = 'vargamma',
	d = 'vardelta',
	e = 'varepsilon',
	z = 'varzeta',
	h = 'vareta',
	q = 'vartheta',
	i = 'variota',
	k = 'varkappa',
	l = 'varlambda',
	m = 'varmu',
	n = 'varnu',
	x = 'varxi',
	o = 'varomicron',
	p = 'varpi',
	r = 'varrho',
	s = 'varsigma',
	t = 'vartau',
	u = 'varupsilon',
	f = 'varphi',
	c = 'varchi',
	y = 'varpsi',
	w = 'varomega',
	A = 'varAlpha',
	B = 'varBeta',
	G = 'varGamma',
	D = 'varDelta',
	E = 'varEpsilon',
	Z = 'varZeta',
	H = 'varEta',
	Q = 'varTheta',
	I = 'varIota',
	K = 'varKappa',
	L = 'varLambda',
	M = 'varMu',
	N = 'varNu',
	X = 'varXi',
	O = 'varOmicron',
	P = 'varPi',
	R = 'varRho',
	S = 'varSigma',
	T = 'varTau',
	U = 'varUpsilon',
	F = 'varPhi',
	C = 'varChi',
	Y = 'varPsi',
	W = 'varOmega',
}

local beg_aux = function(args, parent, user_args)
	if (args[1][1] == 'enumerate' or args[1][1] == 'itemize') then
		return '\\item '
	elseif (args[1][1] == 'description') then
		return '\\item['
	else
		return ''
	end
end

return {
	s(
		{ trig = '"', snippetType = 'autosnippet' },
		fmta("``<>''", { d(1, VISUAL) })
	),

	s(
		{ trig = '||', snippetType = 'autosnippet' },
		fmta('\\lvert <>\\rvert', { d(1, VISUAL) }),
		{ condition = math_mode }
	),

	s(
	{ trig = "mm", snippetType = 'autosnippet' },
	fmta('$<>$', { d(1, VISUAL) })
	),

	s(
		{
			trig = 'MM',
			priority = 1002,
			snippetType = 'autosnippet'
		},
		fmta('\\[\n\t<>\n\\]', { i(0) })
	),

	s(
		{
			trig = 'nbeg',
			priority = 1001,
			snippetType = 'autosnippet'
		},
		fmta(
			'\\begin{<>}[<>]\n\t<><>\n\\end{<>}',
			{ i(1), i(2), f(beg_aux, {1}), i(0), rep(1) }
		),
		{ condition = b }
	),

	s(
		{
			trig = 'beg',
			snippetType = 'autosnippet' 
		},
		fmta(
			'\\begin{<>}\n\t<><>\n\\end{<>}',
			{ i(1), f(beg_aux, {1}), i(0), rep(1) }
		),
		{ condition = b }
	),

	s(
	{ trig = 'fem', snippetType = 'autosnippet' },
	fmta('\\emph{<>}', { d(1, VISUAL) })
	),

	s(
	{ trig = 'fii', snippetType = 'autosnippet' },
	fmta('\\textit{<>}', { d(1, VISUAL) })
	),

	s(
	{ trig = 'fbb', snippetType = 'autosnippet' },
	fmta('\\textbf{<>}', { d(1, VISUAL) })
	),

	s(
	{ trig = 'ftt', snippetType = 'autosnippet' },
	fmta('\\texttt{<>}', { d(1, VISUAL) })
	),

	s(
		{
			trig = '//',
			wordTrig = false,
			snippetType = 'autosnippet' 
		},
		fmta('\\frac{<>}{<>}', { i(1), i(2) })
	),

	s(
		{
			trig = '(%d+)//',
			wordTrig = false,
			regTrig = true,
			priority = 1001,
			snippetType = 'autosnippet' 
		},
		fmta('\\frac{<>}{<>}', { m(1), i(1) })
	),

	s(
		{
			trig        = '(%a%a-)vec',
			wordTrig    = false,
			regTrig     = true,
			snippetType = 'autosnippet'
		},
		fmta(
			'<>',
			{
				f(
					function(_, snip)
						return fancy_wrap(snip.captures[1], 'vec', 'overrightarrow')
					end
				)
			}
		),
		{ condition = math_mode }
	),

	s(
		{
			trig        = '(%a%a-)mca',
			wordTrig    = false,
			regTrig     = true,
			snippetType = 'autosnippet'
		},
		fmta(
			'<>',
			{
				f(
					function(_, snip)
						return fancy_wrap(snip.captures[1], 'mathcal', 'mathcal')
					end
				)
			}
		),
		{ condition = math_mode }
	),

	s(
		{
			trig        = '(%a%a-)mbb',
			wordTrig    = false,
			regTrig     = true,
			snippetType = 'autosnippet'
		},
		fmta(
			'<>',
			{
				f(
					function(_, snip)
						return fancy_wrap(snip.captures[1], 'mathbb', 'mathbb')
					end
				)
			}
		),
		{ condition = math_mode }
	),

	s(
	{
		trig        = '(%a)(%d)',
		regTrig     = true,
		wordTrig    = false,
		snippetType = 'autosnippet'
	},
	fmta('<>_<>', { m(1), m(2) }),
	{ condition = math_mode }
	),

	s(
	{
		trig        = '_(%d)(%d)',
		regTrig     = true,
		wordTrig    = false,
		snippetType = 'autosnippet'
	},
	fmta('_{<><><>}', { m(1), m(2), i(1) }),
	{ condition = math_mode }
	),

	s(
	{
		trig        = '%^([%d%-])(%d)',
		regTrig     = true,
		wordTrig    = false,
		snippetType = 'autosnippet'
	},
	fmta('^{<><><>}', { m(1), m(2), i(1) })
	),

	s(
	{
		trig        = '%^(%a)(%d)',
		regTrig     = true,
		wordTrig    = false,
		priority    = 1001,
		snippetType = 'autosnippet'
	},
	fmta('^{<>_<><>}', { m(1), m(2), i(1) })
	),

	s(
		{
			trig        = '%^(%a)(%l)%2',
			regTrig     = true,
			wordTrig    = false,
			priority    = 1002,
			snippetType = 'autosnippet'
		},
		fmta('^{<>_<><>}', { m(1), m(2), i(1) })
	),

	s(
		{
			trig = '%^(%l)([%-%+])',
			regTrig     = true,
			wordTrig    = false,
			priority    = 1002,
			snippetType = 'autosnippet'
		},
		fmta('^{<><><>}', { m(1), m(2), i(1) })
	),

	s(
		{
			trig        = 'set',
			snippetType = 'autosnippet'
		},
		fmta('\\{<>\\}', { d(1, VISUAL) }),
		{ condition = math_mode }
	),

	s(
		{
			trig        = '^^',
			wordTrig    = false,
			snippetType = 'autosnippet'
		},
		fmta('^{<>}', { d(1, VISUAL) })
	),

	s(
		{
			trig        = '__',
			wordTrig    = false,
			snippetType = 'autosnippet'
		},
		fmta('_{<>}', { d(1, VISUAL) })
	),

	s(
		{
			trig        = 'xx',
			wordTrig    = false,
			snippetType = 'autosnippet'
		},
		t('\\times')
	),

	s(
		{
			trig        = 'o+',
			wordTrig    = false,
			snippetType = 'autosnippet'
		},
		t('\\oplus')
	),

	s(
		{
			trig        = '€',
			wordTrig    = false,
			snippetType = 'autosnippet'
		},
		t('\\in'),
		{ condition = math_mode }
	),

	s(
		{
			trig        = '->',
			wordTrig    = false,
			snippetType = 'autosnippet'
		},
		t('\\to')
	),

	s(
		{
			trig        = '=>',
			wordTrig    = false,
			snippetType = 'autosnippet'
		},
		t('\\implies')
	),

	s(
		{
			trig        = '\\\\\\',
			wordTrig    = false,
			snippetType = 'autosnippet'
		},
		t('\\setminus')
	),

	s(
		{
			trig        = '!>',
			wordTrig    = false,
			snippetType = 'autosnippet'
		},
		t('\\mapsto')
	),

	s(
		{
			trig        = '>=',
			wordTrig    = false,
			snippetType = 'autosnippet'
		},
		t('\\ge ')
	),

	s(
		{
			trig        = '<=',
			wordTrig    = false,
			snippetType = 'autosnippet'
		},
		t('\\le ')
	),

	s(
		{
			trig        = 'cc',
			wordTrig    = false,
			priority    = 1002,
			snippetType = 'autosnippet'
		},
		t('\\subseteq'),
		{ condition = math_mode }
	),

	s(
		{
			trig = 'iff',
			wordTrig = false,
			priority = 1002,
			snippetType = 'autosnippet'
		},
		t('\\iff')
	),

	s(
	{
		trig        = 'bigfun',
		wordTrig    = false,
		snippetType = 'autosnippet'
	},
	fmta('<>:<> &\\to <> \\\\\n<> &\\mapsto <>(<>)=<>\n\n', { i(1, 'f'), i(2, '\\R'), i(3, '\\R'), i(4, 'x'), rep(1), rep(4), i(5) })
	),

	s(
		{
			trig = '%s?%*%*',
			wordTrig = false,
			regTrig = true,
			snippetType = 'autosnippet'
		},
		t(' \\cdot ')
	),

	s(
	{
		trig = '(%l?)%.%.%.',
			wordTrig = false,
			regTrig = true,
			snippetType = 'autosnippet'
		},
		fmta('\\<>dots', { m(1) }),
		{ condition = math_mode }
	),

	s(
		{
			trig        = '(%u)%1',
			wordTrig    = false,
			regTrig     = true,
			priority    = 1001,
			snippetType = 'autosnippet'
		},
		fmta('\\mathbb <>', { m(1) }),
		{ condition = math_mode }
	),

	s(
		{
			trig        = '(%a)(%l)%2',
			wordTrig    = false,
			regTrig     = true,
			snippetType = 'autosnippet'
		},
		fmta('<>_<>', { m(1), m(2) }),
		{ condition = math_mode }
	),

	s(
		{
			trig        = '_(%l)([%-%+])',
			wordTrig    = false,
			regTrig     = true,
			snippetType = 'autosnippet'
		},
		fmta('_{<><><>}', { m(1), m(2), i(1) }),
		{ condition = math_mode }
	),

	s(
		{
			trig        = '_(%l)(%d)',
			wordTrig    = false,
			regTrig     = true,
			priority    = 1001,
			snippetType = 'autosnippet'
		},
		fmta('_{<>_<><>}', { m(1), m(2), i(1) }),
		{ condition = math_mode }
	),

	s(
		{
			trig        = '_(%a)(%l)%2',
			regTrig     = true,
			wordTrig    = false,
			priority    = 1002,
			snippetType = 'autosnippet'
		},
		fmta('_{<>_<><>}', { m(1), m(2), i(1) })
	),

	s(
		{
			trig        = '(%a%a-)bar',
			wordTrig    = false,
			regTrig     = true,
			snippetType = 'autosnippet'
		},
		fmta(
			'<>',
			{
				f(
					function(_, snip)
						return fancy_wrap(snip.captures[1], 'bar', 'overline')
					end
				)
			}
		),
		{ condition = math_mode }
	),

	s(
		{
			trig        = '(%a%a-)hat',
			wordTrig    = false,
			regTrig     = true,
			snippetType = 'autosnippet'
		},
		fmta(
			'<>',
			{
				f(
					function(_, snip)
						return fancy_wrap(snip.captures[1], 'hat', 'widehat')
					end
				)
			}
		),
		{ condition = math_mode }
	),

	s(
		{
			trig        = '@v(%a)',
			wordTrig    = false,
			regTrig     = true,
			priority    = 1001,
			snippetType = 'autosnippet'
		},
		fmta(
			'\\<>',
			{
				f( function(_, snip) return var_greek[snip.captures[1]] end )
			}
		)
		--{ condition = math_mode }
	),

	s(
		{
			trig        = '@([a-uw-zA-Z])',
			wordTrig    = false,
			regTrig     = true,
			snippetType = 'autosnippet'
		},
		fmta(
			'\\<>',
			{ f( function(_, snip) return greek[snip.captures[1]] end ) }
		)
		--{ condition = math_mode }
	),

	s(
		{
			trig = 'sum',
			wordTrig = false,
			snippetType = 'autosnippet'
		},
		fmta(
			'\\sum_{<>}^<> ',
			{ i(1, 'i=1'), i(2) }
		),
		{ condition = math_mode }
	),

	s(
		{
			trig = 'pac',
			wordTrig = false
		},
		fmta(
			'\\usepackage[<>]{<>}',
			{ i(2), i(1) }
		)
	),

	s(
		{
			trig = 'int',
			wordTrig = false
		},
		fmta(
			'\\int_{\\mathbb R^<>} <>\\ \\mathrm{d}',
			{ i(1, 'd'), i(2) }
		)
	),

	s(
		{
			trig = 'tf',
			wordTrig = false
		},
		fmta(
			'\\int_{\\mathbb R^2} <>\\e^{-2\\pi ix\\cdot\\xi}\\ \\mathrm{d}x',
			{ i(1) }
		)
	),

	s(
		{
			trig = "b(",
			snippetType = 'autosnippet'
		},
		fmta('\\bigl(<>\\bigr)', { d(1, VISUAL) })
	),

	s(
		{
			trig = "B(",
			snippetType = 'autosnippet'
		},
		fmta('\\Bigl(<>\\Bigr)', { d(1, VISUAL) })
	)
}
