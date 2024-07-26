local M = {}

function M.enumerate(str_input)
  local i = 0
  local n = #str_input
  return function()
    i = i + 1
    if i <= n then
      return i, str_input:sub(i, i)
    end
  end
end
return M
