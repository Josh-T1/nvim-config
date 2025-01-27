local line_begin = require("luasnip.extras.expand_conditions").line_begin
local helper = require("luasnip_helpers")
local ls = require("luasnip")
local mathzone = helper.in_mathzone
local not_mathzone = helper.not_mathzone
local line_start = helper.line_start

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node
local sn = ls.snippet_node
local fmta =  require("luasnip.extras.fmt").fmta

return {
  s(
  {trig="section", snippetType="autosnippet"},
  {t("\\section*{"), i(1), t("}")},
  {condition = line_start(8)}
  ),

  s(
  {trig="rline", snippetType="autosnippet"},
  {t("\\rline{"), i(1), t("}")},
  {condition = not_mathzone}
  ),

  s(
  {trig="uline", snippetType="autosnippet"},
  {t("\\uline{"), i(1), t("}")},
  {condition = not_mathzone}
  ),

  s(
  {trig="note", snippetType="autosnippet"},
  fmta(
  [[
  \framedtext{
  Note:
  
  <>
  }
  ]],
  {i(1)}
  ),
  {condition = line_start(5)}
  ),

  s(
  {trig=">pf", snippetType="autosnippet"},
  fmta(
  [[
  \pf{<>}{
  <>
  }
  ]],
  {
      i(1),
      i(2)
  }
  ),
  {condition = line_start(4)}
  ),

  s(
  {trig="ct", snippetType="autosnippet"},
  {t("\\customTitle{"), i(1), t("}")},
  {condition = line_start(3)}
  ),

  s(
  {trig="ct1", snippetType="autosnippet"},
  {t("\\customTitlel{"), i(1), t("}")},
  {condition = line_start(4)}
  ),

  s(
  {trig=">def", snippetType="autosnippet", wordTrig=true, regTrig=false},
  fmta(
  [[
  \defin{<>}{
  <>
  }
  ]],
  {i(1),i(2)}
  ),
  {condition = line_start(5)}
  ),
	
  s(
  {trig=">coro", snippetType="autosnippet", wordTrig=true, regTrig=false},
  fmta(
  [[
  \corollary{<>}{
  <>
  }
  ]],
	{i(1),i(2)}
	),
	{condition = line_start(6)}
	),

  s(
  {trig=">qs", snippetType="autosnippet", wordTrig=true, regTrig=false},
  fmta(
  [[
  \qs{}{
  <>
  }
  ]],
  {i(1)}
  ),
  {condition = line_start(4)}
  ),

  s(
  {trig=">aeq", snippetType="autosnippet", wordTrig=true, regTrig=false},
  fmta(
  [[
  \begin{align*}
  <> & <> \\
  <> & <> \\
  \end{align*}
  ]],
  { i(1), i(2), i(3), i(4)}
  ),
  {condition = not_mathzone}
  ),

--  s(
--  {trig="N", snippetType="autosnippet", wordTrig=true, regTrig=false},
--  {i(1), t(" & "), i(2), t("\\\\")},
--  {condition = helper.is_inside("align")}
--  ),

--  s(
--  {trig="N", snippetType="autosnippet", wordTrig=true, regTrig=false},
--  {
--    d(1, function()
--      local nodes = {i(1), t(" & "), i(2)}
--      local cursor_pos = vim.api.nvim_win_get_cursor(0)
--      local buf = vim.api.nvim_get_current_buf()
--      local win = vim.api.nvim_get_current_win()
--      vim.api.nvim_buf_set_lines(buf, cursor_pos[1], cursor_pos[1], false, {""})
--      vim.api.nvim_win_set_cursor(win, {cursor_pos[1] + 1, 0})
--      return sn(nil, nodes)
--    end)
--  },
--  {condition = helper.is_inside("align")}
--  ),

  s(
	{trig=">ans", snippetType="autosnippet", wordTrig=true, regTrig=false},
	fmta(
	[[
  \an{}{
  <>
  }
	]],
	{i(1)}
	),
	{condition = line_start(5)}
	),

  s(
	{trig=">lem", snippetType="autosnippet", wordTrig=true, regTrig=false},
	fmta(
	[[
  \lemma{<>}{
  <>
  }
	]],
	{i(1),i(2)}
	),
	{condition = line_start(5)}
	),
  
  s(
	{trig=">prop", snippetType="autosnippet", wordTrig=true, regTrig=false},
	fmta(
	[[
  \proposition{<>}{
  <>
  }
	]],
	{i(1),i(2)}
	),
	{condition = line_start(6)}
	),
	
  s(
	{trig=">ex", snippetType="autosnippet", wordTrig=true, regTrig=false},
	fmta(
	[[
  \ex{<>}{
  <>
  }
	]],
	{i(1),i(2)}
	),
	{condition = line_start(4)}
	),

	s(
	{trig=">theo", snippetType="autosnippet"},
	fmta(
	[[
  \theo{<>}{
  <>
  }
	]],
	{i(1), i(2)}
	),
	{condition = line_start(6)}
	),

	s(
	{trig=">sol", snippetType="autosnippet"},
	fmta(
	[[
  \solution{<>}{
  <>
  }
	]],
	{i(1), i(2)}
	),
	{condition = line_start(5)}
	),

	s(
	{trig=">prob", snippetType="autosnippet"},
	fmta(
	[[
  \problem{<>}{
  <>
  }
	]],
	{i(1), i(2)}
	),
	{condition = line_start(6)}
	),


	s(
	{trig=">eq", snippetType="autosnippet"}, 
	fmta(
	[[
  \begin{equation*}
    <>
  \end{equation*}
	]],
	{
		i(1),
	}
	),
	{condition = not_mathzone}
	),

	s(
	{trig="list", snippetType="autosnippet"}, 
	fmta(
	[[
  \begin{enumerate}
  <>
  \end{enumerate}
	]],
	{i(1)}
	),
	{condition = line_begin}
	),
  
  s(
  {trig="item", snippetType="autosnippet"},
  {
      t("\\item")
  },
  {condition = line_begin}
  ),

----------------------------------------
---            Text Env              ---
----------------------------------------
  s(
  {trig=";",wordTrig=true, description="math zone",
	snippetType="autosnippet"},
  { 
    t("\\("), i(1), t("\\)"),i(0)
  },
  {condition = function()
      -- expand if not mathzone and preceding char is not %w or at start of line
        if mathzone() then
            return false
        end
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local preceding_char = helper.prev_char(1)
        if preceding_char ~= nil then
            return not preceding_char:match("%w")
        end
        return col == 1
    end
  }
  ),

  s(
  {trig="text", wordTrig=true, regTrig=false, description="text zone inside math zone",
  snippetType="autosnippet"},
  {
  t("\\text{ "), i(1), t(" }")
  },
  {condition = mathzone}
  ),




	----------------------------------------
	---       Linear Algebra Env         ---
	----------------------------------------

-- ** Modifying this function may affect behaviour of helperfn.mat **

--[[
  ** Warning the logic is horrendous and any changes will probably break this if its not already broken
  Order of params in ([a%]*) matter
  Nothing specified then defaults to regular p matrix
  Param Order:
  1. [(d)dots] dots for filling matrix with dots, ddots will put one set on the diagonal
    - This option requires matrix to be of size 3x3 or larger and will put dots in 'middle' round upp when even
  2. [PpVv] (letter)matrix, pmatrix (default)
  3. [ar] array or regular (default)

--]]

    
	s(
	{trig="textbf", snippetType="autosnippet"},
	{
    t("\\textbf{"), i(1), t("}"), i(0)
  },
    {condition = not_mathzone}
	),
	
    
  s(
	{trig="vsp", snippetType="autosnippet"},
	{
    t("\\vspace{1cm}")
  }
	),

  s(
	{trig="hsp", snippetType="autosnippet"},
	{
    t("\\hspace{0.5cm}")
  }
	),
    -- Add visual selection for \underbrace{}_text{}
    -- multine line equations (gather*)
    -- could i have = expand to &= for align env
    -- is there a clean way to have assumtions tag
}
