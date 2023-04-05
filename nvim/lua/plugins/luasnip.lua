return {
	'L3MON4D3/LuaSnip',
	lazy = false,
	--build = "make install_jsregexp", -- Recomendado por el creador.
	config = function()
		require('luasnip').setup({
			delete_check_events = 'TextChanged',
			enable_autosnippets = true,
			history = true,
		})
		require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })

		vim.cmd([[
			imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
			inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

			snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
			snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

			imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
			smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
		]])
	end
}
