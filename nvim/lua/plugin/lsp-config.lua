return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local lspconfig = require('lspconfig')

		lspconfig.clangd.setup({
			cmd = { "clangd", "--background-index", "--clang-tidy" },
		})

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' },
					},
				},
			}
		})

		-- Global mappings.
		vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Diagnostic' })

		vim.keymap.set('n', '<leader>bd', vim.diagnostic.setloclist, { desc = 'Disgnostics' })
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })


		-- LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				local formatCode = function()
					vim.lsp.buf.format({ async = true })
				end

				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = 'Declaration' })
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'Definition' })
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = 'References' })
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = 'Implementation' })

				vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'Hover' })
				vim.keymap.set('n', '<C-K>', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = 'Signature Help' })

				vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Action' })
				-- vim.keymap.set('n', '<leader>cf', formatCode, { buffer = ev.buf, desc = 'Format' })
				vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'Rename' })

				-- vim.keymap.set('n', '<leader>bf', formatCode, { buffer = ev.buf, desc = 'Format' })
			end,
		})
	end
}
