local present, lualine = pcall(require, "lualine")

if not present then
	return
end

lualine.setup {
	options = {
		icons_enabled = true,
		theme = 'dracula'
	}
}
