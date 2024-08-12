vim.g.lua_host_prog = "/usr/local/bin/lua5.4"
local Plug = vim.fn['plug#']
vim.call('plug#begin')
-- my Plug
Plug '~/.config/nvim/plugged/converter'
-- My plug for adding brackets
Plug '~/.config/nvim/plugged/saround'
-- my plug for commenting lines out
Plug '~/.config/nvim/plugged/CommentOut'
-- Latex plug for previewing
Plug 'lervag/vimtex'
-- Luasnip plug for code snippets
Plug 'L3MON4D3/LuaSnip'
-- Auto match brackets
Plug 'jiangmiao/auto-pairs'
-- Colorscheme plugs
Plug 'tomasr/molokai'
Plug('dracula/vim', {as = 'dracula'})
Plug('catppuccin/nvim', { as = 'catppuccin' })
--Markdown plug to preview .md
Plug 'iamcco/markdown-preview.nvim'
-- Lsp/Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'neovim/nvim-lspconfig'
-- Luasnip preview plugin for cmp
Plug 'saadparwaiz1/cmp_luasnip'
-- Telescope
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.5' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
-- Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
--Auto suggestions (Issue) needs to be disabled for filetype tex
--Plug 'vim-scripts/AutoComplPop'
-- R Plugins
Plug 'jalvesaq/Nvim-R'
vim.call('plug#end')

vim.cmd('syntax on')
-- molokai
vim.cmd('colorscheme catppuccin')


local setup = require("setup")


--------------------------------------------------------
--              Global Options                        --
--------------------------------------------------------

-- sets numbers on left side of screen
vim.opt.number = true
-- default split direction for new buffer
vim.opt.splitright = true
-- Prevent text from wrapping
vim.opt.wrap = false
-- vim.optting invisible character representations
vim.opt.listchars = {trail = '~'}
-- vim highlights text that will be subsituted but does not split window to preview
vim.opt.inccommand = 'nosplit'
-- mouse support in 'a'll modes
vim.opt.mouse = 'a'
-- enables highlight for partial matches on search
vim.opt.hlsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim inserts space characters in-place of tab character
vim.opt.expandtab = true
-- highlights matching bracket
vim.opt.showmatch = true
-- case insensitive when all lower case letters are searched, case sensitive in capital letter present
vim.opt.smartcase = true

-- spell autocorrect shortcur
vim.keymap.set('i', "<localleader>q", "<c-g>u<Esc>[s1z=`]a<c-g>u")
vim.keymap.set('n', "<localleader>q", "<c-g>u<Esc>[s1z=`]a<c-g>u")

-- Remove tailing whitespace from python files
vim.api.nvim_create_autocmd('BufWritePre',{
  pattern = "*.py",
  command = ":%s/\\s\\+$//e"
})



vim.g.python3_host_prog = vim.fn.expand('~/.pyenv/versions/py3nvim/bin/python')
vim.g.python_host_prog = vim.fn.expand('~/.pyenv/versions/py3nvim/bin/python')
-- My plug mappings
vim.g.saround_square_key_user = "sss"
vim.g.saround_curly_key_user = "ssc"
vim.g.saround_round_key_user = "ssr"
vim.g.mapleader = ','
-- go to file
vim.keymap.set('n', 'gf', function()
  setup.curr_buf()
end)

vim.keymap.set('n', 'gb', '<Cmd>Telescope buffers<cr>')
-- grep notes
vim.keymap.set('c', 'gb', '<Cmd>setup.grep_code_notes()<cr>')

vim.keymap.set('n', 'fl', '<Cmd>Telescope find_files<cr>')
vim.keymap.set('n', 'fg', '<Cmd>Telescope find_files cwd=~/<cr>')
vim.keymap.set('n', 'fc', '<Cmd>Telescope find_files cwd=~/.config/nvim<cr>')
vim.keymap.set('v', "<C-c>", ":'<,'>w !pbcopy<cr><cr>")

-- general movements
vim.keymap.set('i', '<leader>l', '<Right>')
vim.keymap.set('i', '<leader>h', '<left>')
-- file tree
vim.keymap.set('i', '<leader>t', '<esc><Cmd>Lex<cr><Cmd>vertical resize 30<cr>')
vim.keymap.set('n', '<leader>t', '<esc><Cmd>Lex<cr><Cmd>vertical resize 30<cr>')
-- change buffers
vim.keymap.set('n', '<leader>h', '<esc><C-w>h')
vim.keymap.set('n', '<leader>l', '<esc><C-w>l')
vim.keymap.set('n', '<leader>j', '<esc><C-w>j')
vim.keymap.set('n', '<leader>k', '<esc><C-w>k')
-- write to file
vim.keymap.set('i', '<leader>w', '<esc><Cmd>w<cr>')
vim.keymap.set('n', '<leader>w', '<esc><Cmd>w<cr>')

vim.api.nvim_create_user_command("ReloadConfig", function()
  vim.cmd("luafile ~/.config/nvim/init.lua")
  vim.notify("Sourced init.lua", {title = "Nvim"})
end, {})
vim.keymap.set("n", 'so', "<Cmd>ReloadConfig<cr>")

-- Markdown
vim.api.nvim_create_augroup("MarkdownSettings", {clear = true})
