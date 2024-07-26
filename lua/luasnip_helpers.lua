local M = {}

local ls = require("luasnip")
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
function M.mat(args, snip)
  local rows = tonumber(snip.captures[1]) -- These two lines are dependent on snippet
  local cols = tonumber(snip.captures[2])
  local dots = string.find(snip.captures[3], "dt") -- make sure valid size
  local nodes = {}
  local insert_index = 1

  for j = 1, rows do
    if dots ~= nil and j ~= 1 and j ~= rows then
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

-- Used in matrix snippet to determine if type pmatrix....ect
function M.matrix_type(_, snip)
  if snip.captures[3] == nil then
    return "pmatrix"
  end

  local res = snip.captures[3]:gsub("adt", ""):gsub("dt", "")

  if res ~= "" and res ~= "a" and res ~= "r" then
    return res .. "matrix"
  else
    return "pmatrix"
  end
end

return M

