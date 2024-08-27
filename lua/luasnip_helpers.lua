local M = {}

local ls = require("luasnip")
local tools = require("tools")
local sn = ls.snippet_node
local i = ls.insert_node
local r = ls.restore_node
local t = ls.text_node
local f = ls.function_node


function M.get_visuals(args, parents)
	if (#parents.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parents.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
end

function M.is_inside(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end

function M.in_mathzone()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

function M.line_start(line_number)
  return function()
    local col = vim.fn.col('.')
    return col == line_number
  end
end
--function M.line_begin()
--  local col = vim.fn.col('.')
--  local word = vim.fn.expand('<cword>')
----  return vim.api.nvim_win_get_cursor(0)[2] == 3
--  return word == 0
--end
--
function M.not_mathzone()
  return vim.fn['vimtex#syntax#in_mathzone']() == 0
end


-- Dynamically create matrix using luasnip
-- @param n Integer: number of columns as string
-- @param m Interger: number of rows as string
-- @param dots Bool: If true only insert nodes will be diagonals, off diagals
function M.mat(m, n, dots)
  local rows = tonumber(m)
  local cols = tonumber(n)
  --local dots = string.find(snip.captures[3], "dt") -- make sure valid size
  local nodes = {}
  local insert_index = 1

  for j = 1, rows do
    if dots ~= nil and j ~= 1 and j ~= rows then -- check to see if we are on matrix boundry
      table.insert(nodes, t(""))
    else
      table.insert(nodes, i(insert_index))
      insert_index = insert_index + 1
    end

    for k = 2, cols do
      local not_top_right_corner = (j ~= 1 or k ~= cols)
      local not_bottom_left_corner = (k ~= 1 or j ~= rows)

      table.insert(nodes, t(" & "))

      if dots ~= nil and k == j and j == math.ceil(rows / 2) then
        table.insert(nodes, t("\\ddots"))
      elseif dots ~= nil and j ~= k and not_top_right_corner and not_bottom_left_corner then
        table.insert(nodes, t(""))
      else
        table.insert(nodes, i(insert_index))
        insert_index = insert_index + 1
      end

    end

    if j ~= rows then -- avoid extra blank line at the end of matrix
      table.insert(nodes, t{"\\\\", ""})
    end
  end
  return sn(nil, nodes)
end

-- Used in matrix snippet to determine matrix type. e.g pmatrix
-- @param m_type: type of matrix
-- @returns: type as string
function M.matrix_type(m_type)
  if m_type == nil then
    return "pmatrix"
  end

  local res = m_type:gsub("adt", ""):gsub("dt", "")

  if res ~= "" and res ~= "a" and res ~= "r" then
    return res .. "matrix"
  else
    return "pmatrix"
  end
end


-- Looks at line that cursor is on. Finds the first closing bracket that has no matching opening bracket in a position after the cursor, 
-- and sets cursor to the position of the character after the closing bracket
function M.move_cursor_outside_bracket()
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

-- Gets preceding character at -index. Current char is index 0
-- If index is out of range nil is returned
-- @param index Integer: get preceeding char at -index
-- @returns String | nil
function M.prev_char(index)
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if col > index then
      return line:sub(col - index, col - index)
  end
  return nil
end

function M.pop_prev_char(index)
  local line = vim.api.nvim_get_current_line()
  local pos = vim.api.nvim_win_get_cursor(0)
  local col = pos[2]
  local row = pos[1]
  if col > index then
      local new_line = line:sub(1, col - index - 1) .. line:sub(col - index + 1)
      local buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_lines(buf, row - 1, row, false, {new_line})
      vim.api.nvim_win_set_cursor(0, {row, col + 2})
      return line:sub(col - index, col - index)
  end
  return nil
end

return M
