return {
	"backdround/global-note.nvim",
	config = function()
		local global_note = require("global-note")
		global_note.setup({
			filename = "global.md",
			directory = "~/notes/",

			additional_presets = {
				projects = {
					filename = "projects-to-do.md",
					title = "List of projects",
					command_name = "ProjectsNote",
					-- All not specified options are used from the root.
				},

				food = {
					filename = "want-to-eat.md",
					title = "List of food",
					command_name = "FoodNote",
					-- All not specified options are used from the root.
				},
			},
		})

		vim.keymap.set("n", "<leader>n", global_note.toggle_note, { desc = "Toggle global note", })
	end
}
