-- **KEEP THIS LINE** until all Vim-based plugins/functions are gone.
vim.cmd('set runtimepath^=~/.vim')
vim.cmd('source ~/.vimrc')
-- require('plugins')
require("config.lazy")
-- require('core.keymaps')
-- TODO not use vimrc but ?
-- TODO use other plugin manager
--
-- require'marks'.setup {
--   default_mappings = true,
--   signs = true,
--   mappings = {}
-- }
