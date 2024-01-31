local NS = { noremap = true, silent = true }

-- Options.
vim.opt.clipboard      = "unnamedplus"
vim.opt.conceallevel   = 2
vim.opt.ignorecase     = true
vim.opt.lazyredraw     = true
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.scrolloff      = 3
vim.opt.shiftwidth     = 0
vim.opt.smartcase      = true
vim.opt.smartindent    = true
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.swapfile       = false
vim.opt.tabstop        = 2
vim.opt.termguicolors  = true
vim.opt.undofile       = true
vim.opt.cursorline     = true
vim.opt.showmode       = false
vim.opt.incsearch      = true

vim.keymap.set("n", "U", ":redo<CR>", NS)
vim.keymap.set("n", "L", ":bn<CR>", NS)
vim.keymap.set("n", "H", ":bp<CR>", NS)
vim.keymap.set("n", "<C-h>", "<C-w>h", NS)
vim.keymap.set("n", "<C-j>", "<C-w>j", NS)
vim.keymap.set("n", "<C-k>", "<C-w>k", NS)
vim.keymap.set("n", "<C-l>", "<C-w>l", NS)

-- When opening a file, jump to the last cursor position.
vim.cmd([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])
vim.cmd("let g:loaded_perl_provider = 0")
vim.cmd("let g:loaded_python3_provider = 0")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Lazy requires this to be here.

require("lazy").setup({
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme kanagawa")
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons',
		lazy = false,
		priority = 1000,
		opts = { options = { globalstatus = true } }
	},
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons', opts = {} },
	{
		'echasnovski/mini.nvim',
		version = '*',
		config = function()
			require("mini.ai").setup()
			require("mini.align").setup()
			require("mini.bufremove").setup()
			require("mini.comment").setup()
			require("mini.cursorword").setup()
			require("mini.indentscope").setup({
				symbol = "│"
			})
			require("mini.move").setup()
			require("mini.pairs").setup()
			require("mini.splitjoin").setup()
			require("mini.surround").setup()
			require("mini.trailspace").setup()
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp", "markdown_inline" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Setup language servers.
			local lspconfig = require('lspconfig')
			lspconfig.clangd.setup {}


			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					local opts = { buffer = ev.buf }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set('n', '<space>wl', function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
						end, opts)
					vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<space>f', function()
						vim.lsp.buf.format { async = true }
						end, opts)
				end,
			})
		end
	},
	{ "p00f/clangd_extensions.nvim",
		dependencies = "neovim/nvim-lspconfig",
 },
{
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require('alpha').setup(require'alpha.themes.dashboard'.config)
    end
};
})
