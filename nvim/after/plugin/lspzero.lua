local lsp = require('lsp-zero')
lsp.preset('recommended')

local cmp = require('cmp')

lsp.setup_nvim_cmp({
	mapping = lsp.defaults.cmp_mappings({
		['<C-Space>'] = cmp.mapping.complete(),
		['<Tab>'] = vim.NIL,
		['<S-Tab>'] = vim.NIL,
	})
})

lsp.setup()

vim.opt.signcolumn = 'yes'
