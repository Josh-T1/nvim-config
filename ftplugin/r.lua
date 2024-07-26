local setlocal = vim.opt_local

vim.opt.maplocalleader = ","
" autocomplete shortcut
vim.keymap.set('i', "<localleader>a", "<C-x><C-o>")
vim.keymap.set('n', "<localleader>a", "<C-x><C-o>")
