-- Install lazy if it is not already installed.
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

vim.g.mapleader = ' ' -- This is must be done before the lazy setup.

-- Disable netrw (for the file explorer, it must be here).
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("lazy").setup({
	{-- What is a man? A miserable pile of secrets!
		'dracula/vim',
		name = 'dracula'
	},

	{-- The root of all evil.
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
	},

	{-- Fuzzy finder to make your life happier.
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{-- Now with 100% more lua.
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
	},

	{-- My best friend.
		'github/copilot.vim'
	},

	{-- A line to visualize the opened buffers.
		'akinsho/bufferline.nvim'
	},

	{-- Visual aid to see the indentation.
		'lukas-reineke/indent-blankline.nvim'
	},

	{-- LaTeX in hyper mode.
		'lervag/vimtex'
	},

	{-- Snippets.
		'L3MON4D3/LuaSnip'
	},

	{-- File tree.
	  'nvim-tree/nvim-tree.lua',
	  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
	},

	{-- Aligning things.
		'Vonr/align.nvim'
	},

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			-- {'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			--{'rafamadriz/friendly-snippets'}, -- Optional
		}
	},

	{
		"shortcuts/no-neck-pain.nvim",
		version = "*"
	}
})

require('remap')
require('set')

vim.opt.guifont = { 'FiraCode Nerd Font:h12' }
