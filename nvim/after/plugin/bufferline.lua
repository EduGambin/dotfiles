local present, bufferline = pcall(require, 'bufferline')

if not present then
	return
end

bufferline.setup {
	options = {
		mode = 'buffers',
		offsets = {
			{filetype = 'NvimTree'}
		},
	},
	highlights = {
		buffer_selected = {
			italic = false
		},
		indicator_selected = {
			fg = {
				attribute = 'fg',
				highlight = 'Pmenu'
			},
			italic = false
		}
	}
}
