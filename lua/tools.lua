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

-- @path String
function M.file_exists(path)
  local file = io.open(path, 'r')
  if file then
    file:close()
    return true
  else
    return false
  end
end

function M.dir_exists(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == "directory"
end
--function M.print_table(tbl, indent, done)
--  indent = indent or 0
--  done = done or {}
--
--end
function M.remove_line_and_insert_text(bufnr, text)
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local current_line = cursor_pos[1]
  local lines = vim.split(text, '\n')
  vim.api.nvim_buf_set_lines(bufnr, current_line - 1, current_line , false, lines)
end
return M
