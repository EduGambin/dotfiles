return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set('i', '<cr>', 'copilot#Accept("<cr>")', {
			expr = true,
			replace_keycodes = false,
			silent = true
		})
		vim.g.copilot_no_tab_map = true
	end
}
