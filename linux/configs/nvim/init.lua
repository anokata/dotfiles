-- **KEEP THIS LINE** until all Vim-based plugins/functions are gone.
vim.cmd('set runtimepath^=~/.vim')
-- vim.cmd('source ~/.vimrc')
require("config.lazy")
-- require('core.keymaps')
-- TODO not use vimrc but ?
-- TODO use other plugin manager
-- TODO ctrl-q
-- TODO ctrl-o to auto pretty ident
--
-- require'marks'.setup {
--   default_mappings = true,
--   signs = true,
--   mappings = {}
-- }
