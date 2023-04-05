return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons', -- Para los iconos.
		lazy = true -- Carga perezosa (cuando se cargue el padre).
	},
	opts = {
		theme = 'dracula' -- Usar el tema a juego con el editor.
	}
}