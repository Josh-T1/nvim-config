vim.g.lua_host_prog = "/opt/bin/lua5.4"

local Plug = vim.fn['plug#']
vim.call('plug#begin')
-- my Plug
-- My plugin for adding brackets
Plug '~/.config/nvim/myplugins/saround'
-- my plugin for commenting lines out using visual selection
Plug '~/.config/nvim/myplugins/CommentOut'
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
Plug ('iamcco/markdown-preview.nvim',{ ['do'] = 'cd app && npx --yes yarn install' })
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
-- java language server plugin
Plug 'mfussenegger/nvim-jdtls'
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
-- Relative line numbers
vim.opt.relativenumber = true
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


-- Remove tailing whitespace from python files
vim.api.nvim_create_autocmd('BufWritePre',{
  pattern = "*.py",
  command = ":%s/\\s\\+$//e"
})


vim.g.python3_host_prog = vim.fn.exepath("python3")
vim.g.python_host_prog = vim.fn.exepath("python3")
-- My plug mappings
vim.g.saround_square_key_user = "sss"
vim.g.saround_curly_key_user = "ssc"
vim.g.saround_round_key_user = "ssr"
vim.g.mapleader = ','

-- spell autocorrect shortcur
vim.keymap.set('i', "<leader>q", "<c-g>u<Esc>[s1z=`]a<c-g>u")
vim.keymap.set('n', "<leader>q", "<c-g>u<Esc>[s1z=`]a<c-g>u")
-- go to file
vim.keymap.set('n', 'gf', function()
  setup.curr_buf()
end)

vim.keymap.set('n', 'gb', '<Cmd>Telescope buffers<cr>')
-- grep notes
--vim.keymap.set('c', 'gb', '<Cmd>setup.grep_code_notes()<cr>')

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
vim.api.nvim_create_augroup("MarkdownFileTypeKeymaps", {clear = true})
vim.api.nvim_create_augroup("TexFileTypeKeymaps", {clear = true})


-------------------------------------------------------------
---                        LuaSnip                        ---
-------------------------------------------------------------
local luasnip_helpers = require("luasnip_helpers")
local tools = require("tools")
local luasnip = require("luasnip")
require('luasnip.loaders.from_lua').lazy_load({
 paths = {vim.fn.expand("~/.config/nvim/Luasnip")},
})

local function set_tex_keymaps()
  -- Luasnip jump keymaps
  vim.keymap.set('i', '/', function()
    vim.api.nvim_echo({{"Invalid dir", "Normal"}}, false, {})
    local res = luasnip_helpers.move_cursor_outside_bracket()
    if res == false and luasnip.jumpable(1) then
      luasnip.jump(1)
    elseif res == false then
      local key = vim.api.nvim_replace_termcodes("/", true, true, true)
      vim.api.nvim_feedkeys(key, 'n', false)
    end
  end, {expr = false, silent = true, buffer = true}
    )

  vim.keymap.set('i', "<C-/>", function()

    local res = luasnip_helpers.move_cursor_outside_bracket()
    if res == false and luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
  end, {expr = false, silent = true, buffer = true}
    )
  -- SvgTex keymap 
  vim.keymap.set("i", "<C-v>", function()
--    vim.api.nvim_echo({{"Invalid dir", "Normal"}}, false, {})

    local line = vim.fn.getline('.')
    local dir_path = vim.b.vimtex.root .. '/figures/'
    if not tools.dir_exists(dir_path) then
--      vim.api.nvim_feedkeys("a", "insert", false)
      return
    end
    local path = dir_path .. line
    local new_path = path
    local attempts = 0

    while attempts < 3 and tools.file_exists(new_path) do
      attempts  = attempts + 1
      new_path = path .. tostring(attempts)
    end

    if not tools.file_exists(new_path) then
      local tex = [[
\begin{figure}[ht]
    \centering
    \includegraphics[width=\textwidth]{}
\end{figure}]]
      local bufrn = vim.api.nvim_get_current_buf()
      vim.fn.system("veditor -f " .. new_path)
      tools.remove_line_and_insert_text(bufrn, tex)
    end
  end)
end


-------------------------------------------------------------
---                        VimTex                         ---
-------------------------------------------------------------
vim.g.vimtex_view_method='skim'
vim.g.vimtex_view_general_viewer='/Applications/Skim.app/Contents/SharedSupport/displayline'
vim.g.vimtex_view_general_options='-r @line @pdf @tex'
-- %:h returns directory containing file being compiled
 vim.g.vimtex_quickfix_mode = 1
--vim.g.vimtex_compiler_method = 'pdflatex'
vim.g.vimtex_compiler_latexmk = {
            executable =  'latexmk',
            options = {
             '-interaction=nonstopmode',
--             '-aux-directory=' .. vim.fn.expand('%:h') .. '/_aux_files',
            },
        }


local function set_markdown_keymaps()
  vim.keymap.set('n', '<LocalLeader>cc', '<Plug>MarkdownPreview', { noremap = true, silent = true })
  vim.keymap.set('i', '<LocalLeader>cc', '<Esc><Plug>MarkdownPreview', { noremap = true, silent = true })
  vim.keymap.set('n', '<LocalLeader>s', '<Plug>MarkdownPreviewStop', { noremap = true, silent = true })
  vim.keymap.set('n', '<LocalLeader>c', '<Plug>MarkdownPreviewToggle', { noremap = true, silent = true })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "md",
  callback = set_markdown_keymaps,
  group = "MarkdownFileTypeKeymaps"
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = set_tex_keymaps,
    group = "TexFileTypeKeymaps"
})
