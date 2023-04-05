local indentation_size = 2

vim.opt.tabstop = indentation_size -- Tamaño de las tabulaciones.
vim.opt.shiftwidth = indentation_size -- Tamaño de los ocomandos >> y <<.
vim.opt.smartindent = true -- Indentación inteligente.

vim.opt.textwidth = 100 -- Reubicar texto automaticamente.

vim.opt.swapfile = false -- Evita generar archvios 'swap'.
vim.opt.backup = false -- Evita generar archivos 'backup'.

vim.opt.hlsearch = false -- Evita resaltar resultados al buscar.
vim.opt.incsearch = true  -- Mostrar la búsqueda mientras se escribe.
vim.opt.ignorecase = true  -- Ignorar las mayúsculas al buscar...
vim.opt.smartcase = true  -- ...a menos que se usen específicamente.

vim.opt.scrolloff = 8 -- Deja espacio al principio y al final del texto.
vim.opt.termguicolors = true -- Por si acaso.

vim.opt.swapfile = false
vim.opt.backup = false

vim.cmd('set splitbelow') -- Las nuevas ventanas se abren debajo.
vim.cmd('set splitright') -- Las nuevas ventanas se abren detrás.

vim.opt.relativenumber = true -- Números de línea relativos.

vim.opt.shortmess = 'I' -- Desactiva el mensaje inicial.

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.spell = true
vim.cmd('set spelllang=es,en')
vim.cmd('language es_ES.UTF-8')

vim.cmd('let g:tex_flavor = "latex"')
vim.cmd('set conceallevel=2')
