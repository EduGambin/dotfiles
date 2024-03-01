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

local opts = {
	install = {
		colorscheme = {
			"kanagawa" -- While installing plugins, use this colorscheme.
		}
	},
	ui = {
		size = {
			width = 0.9, -- Width of the screen.
			height = 0.9 -- Height of the screen.
		}
	},
	checker = {
		enable = true, -- Automatic check for plugin updates.
	},
	change_detection = {
		notify = false -- Stop lazy from notifying you when a plugin file has been changed.
	}
}

require("lazy").setup("plugin", opts)
