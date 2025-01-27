local setlocal = vim.opt_local
setlocal.tabstop = 2
setlocal.shiftwidth = 2

vim.g.maplocalleader = ","
-- HTML preview
vim.keymap.set('n', "<localleader>cc", "<Cmd>!open %<cr><Esc>")
vim.keymap.set('i', "<localleader>cc", "<Cmd>!open %<cr><Esc>")

