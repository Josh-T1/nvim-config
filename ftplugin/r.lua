local setlocal = vim.opt_local
require('luasnip.loaders.from_lua').lazy_load({
 paths = {vim.fn.expand("~/.config/nvim/Luasnip/r.lua")},
})

vim.opt.maplocalleader = ","
vim.keymap.set('i', "<localleader>a", "<C-x><C-o>")
vim.keymap.set('n', "<localleader>a", "<C-x><C-o>")
-- R --
vim.g.R_assign_map = ";"
vim.keymap.set("v", "<Space>", "<Plug>RDSendSelection")
vim.keymap.set("v", "<Space>", "<Plug>RDSendLine")


