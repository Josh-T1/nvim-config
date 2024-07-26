local setlocal = vim.opt_local
-- Fold config
setlocal.foldmethod = "indent"
setlocal.foldlevel = 99

-- Fold mappings
vim.g.maplocalleader = ","
vim.keymap.set('n', "<space>", "za")
vim.keymap.set('n', "<localleader><space>", "zM")
vim.keymap.set('n', "<localleader><space><space>", "zR")
vim.keymap.set('n', "<localleader><leader>", "<F7>")

-- autocomplete shortcut
vim.keymap.set('i', "<localleader>a", "<C-x><C-o>")
vim.keymap.set('n', "<localleader>a", "<C-x><C-o>")
