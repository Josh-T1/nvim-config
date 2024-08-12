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

--function M.print_table(tbl, indent, done)
--  indent = indent or 0
--  done = done or {}
--
--end
return M
