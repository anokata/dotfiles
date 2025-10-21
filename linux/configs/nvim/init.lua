vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("config.lazy")
require("config.options")
require("config.keymaps")

vim.cmd("let @a = '0f(ldt,f)pui, p0f,dw'")
-- vim.cmd("let @b = ''")

-- TODO ctrl-o to auto pretty ident
