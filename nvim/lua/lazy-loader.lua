-- Install lazy.nvim if it doesn't exist.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	defaults = { lazy = true },
	install = { colorscheme = { "kanagawa" } },
	ui = { size = { width = 0.95, height = 0.95 } },
	checker = {
		enable = true, -- Automatic check for plugin updates.
	},
	change_detection = {
		notify = false, -- Stop lazy from notifying you when a plugin file has been changed.
	},
}

require("lazy").setup("plugin", opts)
