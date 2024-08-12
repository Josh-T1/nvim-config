require('luasnip.loaders.from_lua').lazy_load({
 paths = {vim.fn.expand("~/.config/nvim/Luasnip/lua.lua")},
})

local setlocal = vim.opt_local
setlocal.tabstop = 2
setlocal.shiftwidth = 2



