local M = {}

local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

function M.get_visuals(args, parents)
	if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
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

function M.not_mathzone()
  return vim.fn['vimtex#syntax#in_mathzone']() == 0
end

return M

