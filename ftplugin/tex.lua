package.path = package.path .. ";/Users/joshuataylor/.config/nvim/lua/?.lua"
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
vim.g.tex_conceal='abdmg'
vim.g.maplocalleader = ","
-- hi clear Conceal

-- nmap <localleader>l <plug>(vimtex-view)
vim.keymap.set('n', "<localleader>l", "<Cmd>VimtexCompile<cr>")
-- inoremap <localleader>cc <Cmd>VimtexCompile<cr>
-- spell autocorrect shortcur
vim.keymap.set('i', "<localleader>q", "<c-g>u<Esc>[s1z=`]a<c-g>u")
vim.keymap.set('n', "<localleader>q", "<c-g>u<Esc>[s1z=`]a<c-g>u")
-- inoremap <localleader>q <c-g>u<Esc>[s1z=`]a<c-g>u
-- noremap <localleader>q <c-g>u<Esc>[s1z=`]a<c-g>u
-- figure script shortcuts
-- Would be cool to add cmd dependent on operating system

--------------------------------------------------------
--              MathNote                              --
--------------------------------------------------------
local function read_file(filename)
  local file = io.open(filename, "r")
  if not file then
    return nil
  end

  local content = file:read("*a")
  file:close()
  return content
end


local function get_logging_path()
  -- Returns logging path or /dev/null
  -- I should add better error handling and implement logging
  local filename = "/Users/joshuataylor/documents/python/myprojects/mathnote/config.json"
  local contents = read_file(filename)
  if contents ~= nil then
    local json = vim.fn.json_decode(contents)
    local path = json["shortcutmanager-logging-config"]["handlers"]["file"]["filename"]

    if path ~= nil then
      return path
    end

  end
  return "/dev/null"
end


local function GetArgs(arg)
  local python_path = "/Users/joshuataylor/documents/python/myprojects/mathnote/shortcut_manager/initializer.py"
  local line = vim.fn.getline('.')
  local path = vim.b.vimtex.root .. '/figures/'
  local error_redirct_path = get_logging_path()
  local error_redirect = "2>>" .. error_redirct_path
  local cmd = '.!python3 ' .. python_path .. " " .. arg .. " '" .. line .. "' " .. path .. " " .. error_redirect
  vim.cmd(cmd)
  end

vim.keymap.set('n', "<C-s>", function()
  GetArgs('-c')
end)


--------------------------------------------------------
--              Luasnip                               --
--------------------------------------------------------

-- Looks at line that cursor is on. Finds the first closing bracket that has no matching opening bracket in a position after the cursor, 
-- and sets cursor to the position of the character after the closing bracket
local function move_cursor_outside_bracket()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
  if not line or #line < (col + 1) then
    return false
  else
    line = string.sub(line, col, #line + 1)
  end

  --vim.api.nvim_notify("teset")
  local closing_index = nil
  local braces = {['('] = ")"}
-- {closing bracket = matching opening bracket seen}
  local closing_braces = {[")"] = false}

  for index, char in tools.enumerate(string.sub(line, 2, #line + 1)) do
    if braces[char] ~= nil then
      closing_braces[braces[char]] = not closing_braces[braces[char]]
    end
    -- no matching opening bracket has been seen, move cursor to index + 1
    -- the second condition of checking backslash is only relavent to tex files... need to fix this
    if closing_braces[char] == false and string.sub(line, index, index) ~= '\\' then
      closing_index = index + col
      break
    -- matching brace has been seen, reset as this is now a proper open/close pair
    elseif closing_braces[char] == true then
      closing_braces[char] = false
    end
  end

  if closing_index then
      vim.api.nvim_win_set_cursor(0, {row, closing_index})
  end
  return closing_index ~= nil
end

-- vim.keymap.set(mode, key, action, options)
-- Luasnip
-- expr = true mean that when mapping is invoked editor will evaluate the action as an expression and use result as the actual command
-- silent = true suppresses output
vim.keymap.set('s', '<S-Esc>', function() -- Why 'smap', ahh thats right I have no fucking clue but the 'i' keymap behaves weirdly without this mapping
  local res = move_cursor_outside_bracket()
  if res == false and luasnip.jumpable(1) then
    luasnip.jump(1)
  end
end, {expr = false, silent = true}
  )

vim.keymap.set('i', '<S-Esc>', function()
  local res = move_cursor_outside_bracket()
  if res == false and luasnip.jumpable(1) then
    luasnip.jump(1)
  end
end, {expr = false, silent = true}
  )

vim.keymap.set('i', "<S-Tab>", function()
  local res = move_cursor_outside_bracket()
  if res == false and luasnip.jumpable(-1) then
      luasnip.jump(-1)
  end
end, {expr = false, silent = true}
  )
vim.keymap.set('s', "<S-Tab>", function()
  local res = move_cursor_outside_bracket()
  if res == false and luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    move_cursor_outside_bracket()
  end
end, {expr = false, silent = true}
  )
