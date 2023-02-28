vim.cmd [[
let g:vimtex_format_enabled = 1
let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'zathura'

let g:vimtex_compiler_latexmk = {
	\ 'build_dir' : 'build',
	\ 'options' : [
	\   '-verbose',
	\   '-file-line-error',
	\   '-synctex=1',
	\   '-interaction=nonstopmode',
	\   '-pdf',
	\   '-shell-escape',
	\ ],
\}

]]

vim.keymap.set('n', '<leader>r', '<cmd>VimtexCompile<cr>') -- Compile LaTeX.
