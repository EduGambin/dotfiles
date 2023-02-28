local present, builtin = pcall(require, 'telescope.builtin')

if not present then
	return
end


require('telescope').setup {
	defaults = {
		file_ignore_patterns = {
			'^build/',
			'^fig/'
		}
	}
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
