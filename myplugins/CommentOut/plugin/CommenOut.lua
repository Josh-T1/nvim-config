vim.g.comment_types = {vim = '"', python = "#", tex = '%', sh = "#", lua = '--', zsh = "#"}
local default_table_value = "#"

local metatable = {
  __index = function(_, key)
    return default_table_value
  end
}

setmetatable(vim.g.comment_types, metatable)

local function Comment()
  local comment = vim.g.comment_types[vim.bo.filetype]
  local string_ = ""
  local register_contents = vim.fn.getreg("p")
  local lines = vim.fn.split(register_contents, '\n')
  for _, line in ipairs(lines) do
--    local cleaned_line = vim.fn.substitute(line, '[[:cntrl:]]', '', 'g')
    local cleaned_line = line:gsub("%c", "")
    if line:sub(1, #comment) == comment then
      string_ = string_ .. vim.fn.substitute(cleaned_line, comment, "", "") .. '\n'
    else
      string_ = string_ .. comment .. cleaned_line .. '\n'
    end
  end
  vim.fn.setreg('"', string_)

  vim.api.nvim_feedkeys("p", "n", false)
  vim.api.nvim_feedkeys("k", "n", false)
  vim.api.nvim_feedkeys("dd", "n", false) -- this should be modified to catch edge cases ie top or bottom of file
--  vim.api.nvim_feedkeys("p", 'n', false)
--  vim.api.nvim_feedkeys("k", 'n', false)
  --vim.api.nvim_feedkeys("dd", 'n', false)
end

vim.api.nvim_create_user_command("Comment", function()
  Comment()
end, {})


vim.keymap.set('v', 'cc', function()
  -- paste from unamed register
  vim.api.nvim_feedkeys('"pc', "v", false)
  local feadablekeys = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
  vim.api.nvim_feedkeys(feadablekeys, "n", true)
  vim.defer_fn(function()
    Comment()
  end, 20) -- This is needed because I cant figure out a non asychronous way to use feedback keys (register issues). Fuck vim.api.nvim
end,
{silent = true})
