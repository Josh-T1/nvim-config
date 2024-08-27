package.path = package.path .. ";" .. vim.fn.expand("~/.config/nvim/lua/?.lua")

local luasnip_helpers = require("luasnip_helpers")
local tools = require("tools")
local luasnip = require("luasnip")

local setlocal = vim.opt_local
setlocal.spell = true
-- syntax enable
setlocal.spelllang = "en" -- does this work with quotes?
setlocal.textwidth = 80

vim.g.vimtex_view_method='skim'
vim.g.vimtex_view_general_viewer='/Applications/Skim.app/Contents/SharedSupport/displayline'
vim.g.vimtex_view_general_options='-r @line @pdf @tex'
-- %:h returns directory containing file being compiled
vim.g.vimtex_quickfix_mode = 1
vim.g.vimtex_compiler_latexmk = {
            executable =  'latexmk',
            options = {
             '-pdf',
             '-interaction=nonstopmode',
             '-aux-directory=' .. vim.fn.expand('%:h') .. '/_aux_files',
            },
        }
vim.g.tex_flavor = 'latex'
setlocal.conceallevel = 0
vim.g.tex_conceal = 'abdmg'
vim.g.maplocalleader = ","

--------------------------------------------------------
--              KeyMaps                               --
--------------------------------------------------------
vim.keymap.set('n', "<localleader>c", "<Cmd>VimtexCompile<cr>")


--------------------------------------------------------
--              MathNote                              --
--------------------------------------------------------
--local function read_file(filename)
--  local file = io.open(filename, "r")
--  if not file then
--    return nil
--  end
--
--  local content = file:read("*a")
--  file:close()
--  return content
--end
--

--local function get_logging_path()
  -- Returns logging path or /dev/null
  -- I should add better error handling and implement logging
--  local filename = vim.fn.expand("~/documents/python/myprojects/mathnote/config.json")
--  local contents = read_file(filename)
--  if contents ~= nil then
--    local json = vim.fn.json_decode(contents)
--    local path = json["shortcutmanager-logging-config"]["handlers"]["file"]["filename"]
--
--    if path ~= nil then
--      return path
--    end
--
--  end
--  return "/dev/null"
--end


--local function GetArgs(arg)
--  local python_path = vim.fn.expand("~/Code/python/myprojects/mathnote/shortcut_manager/initializer.py")
--  local line = vim.fn.getline('.')
--  local path = vim.b.vimtex.root .. '/figures/'
--  local error_redirct_path = get_logging_path()
--  local error_redirect = "2>>" .. error_redirct_path
--  local cmd = '.!python3 ' .. python_path .. " " .. arg .. " '" .. line .. "' " .. path .. " " .. error_redirect
--  vim.cmd(cmd)
--  end
--
--vim.keymap.set('n', "<C-s>", function()
--  GetArgs('-c')
--end)


--------------------------------------------------------
--              Luasnip                               --
--------------------------------------------------------



-- vim.keymap.set(mode, key, action, options)
-- Luasnip
-- expr = true mean that when mapping is invoked editor will evaluate the action as an expression and use result as the actual command
-- silent = true suppresses output
