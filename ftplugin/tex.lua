package.path = package.path .. ";" .. vim.fn.expand("~/.config/nvim/lua/?.lua")

local setlocal = vim.opt_local
setlocal.spell = true
-- syntax enable
setlocal.spelllang = "en"
setlocal.textwidth = 80

vim.g.tex_flavor = 'latex'
setlocal.conceallevel = 0
vim.g.tex_conceal = 'abdmg'
vim.g.maplocalleader = ","
vim.g.vimtex_log_level = 2

--------------------------------------------------------
--              KeyMaps                               --
--------------------------------------------------------
vim.cmd([[
spellgood('equicontinuous')
spellgood('Weierstrass')
spellgood('pointwise')
]])

