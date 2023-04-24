local M = {}

M = {
	{
		'neovim/nvim-lspconfig',
		config = function()
			require'lspconfig'.texlab.setup{} -- You need to install texlab first!
			require'lspconfig'.clangd.setup{} -- You need to install clangd first!
			require'lspconfig'.glslls.setup{} -- You need to install glslls first!
		end
	},

	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{ 'neovim/nvim-lspconfig' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'L3MON4D3/LuaSnip' },
			{ 'saadparwaiz1/cmp_luasnip' }
		},
		config = function()
			local cmp = require('cmp')

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					{ name = 'buffer', keyword_length = 7 },
				})
			})

			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			require('lspconfig')['texlab'].setup {
				capabilities = capabilities
			}
			require('lspconfig')['clangd'].setup {
				capabilities = capabilities
			}
			require('lspconfig')['glslls'].setup {
				capabilities = capabilities
			}
		end
	},

	{
		"windwp/nvim-autopairs",
		dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "tex" },
			})

			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			local cmp = require('cmp')
			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)
		end
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "lua",
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
					disable = {
						"latex"
					}
				},
				indent = {
					enable = true,
				},
				matchup = {
					enable = true,
				}				
			})
		end
	},

	{
		'lervag/vimtex', -- You could not live with your own failure. Where did that bring you? Back to me.
		config = function()
			vim.cmd([[
				let g:vimtex_format_enabled = 1
				let g:tex_flavor = 'latex'
				let g:vimtex_view_method = 'zathura'
				let g:vimtex_compiler_latexmk = {
					\ 'build_dir' : 'build',
					\ 'options' : [
					\   '-verbose',
					\   '-file-line-error',
					\   '-synctex=1',
					\   '-interaction=nonstopmode',
					\   '-pdf',
					\   '-shell-escape',
					\ ],
				\}
				let maplocalleader = " "
			]])
		end
	},

	{ 'github/copilot.vim' }
}

return M
