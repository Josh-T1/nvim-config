local line_begin = require("luasnip.extras.expand_conditions").line_begin
local helper = require("luasnip_helpers")
local ls = require("luasnip")
local mathzone = helper.in_mathzone
local not_mathzone = helper.not_mathzone
local line_start = helper.line_start
local mat = helper.mat
local matrix_type = helper.matrix_type

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node

return {
	----------------------------------------
	---            Math Env              ---
	----------------------------------------
  s(
  {trig="section", snippetType="autosnippet"},
  {t("\\section{"), i(1), t("}")},
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
  {trig="uto", snippetType="autosnippet"},
  {t("\\uto{"), i(1), t("}")},
  {condition = mathzone}
	),
  
  s(
  {trig="bto", snippetType="autosnippet"},
  {t("\\bto{"), i(1), t("}")},
  {condition = mathzone}
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
	{trig="pf", snippetType="autosnippet"},
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
	{condition = line_start(3)}
	),

	s(
	{trig="lt", snippetType="autosnippet"},
	{t("\\customTitle{"), i(1), t("}")},
	{condition = line_start(3)}
	),
	
  s(
	{trig="nt", snippetType="autosnippet"},
	{t("\\customTitlel{"), i(1), t("}")},
	{condition = line_start(3)}
	),

	s(
	{trig="def", snippetType="autosnippet", wordTrig=true, regTrig=false},
	fmta(
	[[
  \defin{<>}{
  <>
  }
	]],
	{i(1),i(2)}
	),
	{condition = line_start(4)}
	),
	
  s(
	{trig="coro", snippetType="autosnippet", wordTrig=true, regTrig=false},
	fmta(
	[[
  \corollary{<>}{
  <>
  }
	]],
	{i(1),i(2)}
	),
	{condition = line_start(5)}
	),
	
  s(
	{trig="qs", snippetType="autosnippet", wordTrig=true, regTrig=false},
	fmta(
	[[
  \qs{}{
  <>
  }
	]],
	{i(1)}
	),
	{condition = line_start(3)}
	),
  
  s(
	{trig="aeq", snippetType="autosnippet", wordTrig=true, regTrig=false},
	fmta(
	[[
  \begin{align*}
  <> & <> \\
  <> & <> \\
  \end{align*}
	]],
	{ i(1), i(2), i(3), i(4) }
	),
	{condition = line_begin}
	),
	
  s(
	{trig="ans", snippetType="autosnippet", wordTrig=true, regTrig=false},
	fmta(
	[[
  \an{}{
  <>
  }
	]],
	{i(1)}
	),
	{condition = line_start(4)}
	),

  s(
	{trig="lem", snippetType="autosnippet", wordTrig=true, regTrig=false},
	fmta(
	[[
  \lemma{<>}{
  <>
  }
	]],
	{i(1),i(2)}
	),
	{condition = line_start(4)}
	),
  
  s(
	{trig="prop", snippetType="autosnippet", wordTrig=true, regTrig=false},
	fmta(
	[[
  \proposition{<>}{
  <>
  }
	]],
	{i(1),i(2)}
	),
	{condition = line_start(5)}
	),
	
  s(
	{trig="ex", snippetType="autosnippet", wordTrig=true, regTrig=false},
	fmta(
	[[
  \ex{<>}{
  <>
  }
	]],
	{i(1),i(2)}
	),
	{condition = line_start(3)}
	),

	s(
	{trig="theo", snippetType="autosnippet"},
	fmta(
	[[
  \theo{<>}{
  <>
  }
	]],
	{i(1), i(2)}
	),
	{condition = line_start(5)}
	),

  s(
	{trig="proof", snippetType="autosnippet"},
	fmta(
	[[
  \pf{<>}{
  <>
  }
	]],
	{i(1), i(2)}
	),
	{condition = line_start(6)}
	),

--	s(
--	{trig="bb", snippetType="autosnippet"},
--	fmta(
--	[[
--		\begin{<>}
--		<>
--		\end{<>}
--	]],
--	{i(1), i(2), rep(1)}
--	),
--	{condition = line_start(3)}
--	),
	
	s(
	{trig="eq", snippetType="autosnippet"}, 
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
	{condition = line_begin}
	),

	s(
	{trig="list", snippetType="autosnippet"}, 
	fmta(
	[[
  \mylist{
    \item <>
  }
	]],
	{i(1)}
	),
	{condition = line_begin}
	),

	----------------------------------------
	---            Text Env              ---
	----------------------------------------
	
	s(
	{trig="([^%a]);", wordTrig=false, regTrig=true,
	snippetType="autosnippet"}, 
	{ 
  f( function(_, snip) return snip.captures[1] end ),
	t("\\("), i(1), t("\\)"),i(0)
  },
	{condition = not_mathzone}
	),
	
  s(
	{trig="bb", wordTrig=false, regTrig=true,
	snippetType="autosnippet"}, 
	{ 
    t("("), i(1), t(")"), i(0)
  },
	{condition = not_mathzone}
	),
	
s(
{trig="xx", wordTrig=false, regTrig=true,
snippetType="autosnippet"},
{
--f( function(_, snip) return snip.captures[1] end ),
t("\\text{ "), i(1), t(" }")
},
{condition = mathzone}
),
	
s(
{trig="RR", snippetType="autosnippet"},
{ 
  t("\\mathbb{R}"),
},
{condition = mathzone}
),

s(
{trig="NN", snippetType="autosnippet"},
{ 
  t("\\mathbb{N}")
},
{condition = mathzone}
),

s(
{trig="CC", snippetType="autosnippet"},
{ 
  t("\\mathbb{C}") 
},
{condition = mathzone}
),

s(
{trig="([%s])iff", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
f( function(_, snip) return snip.captures[1] end ),
t("\\(\\leftrightarrow\\)")
},
{condition = not_mathzone}
),

s(
{trig="([%s])if", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
f( function(_, snip) return snip.captures[1] end ),
t("\\Longleftrightarrow")
},
{condition = mathzone}
),
--
--s(
--{trig="([%s])iff", wordTrig=false, regTrig=true, snippetType="autosnippet"},
--{f( function(_, snip) return snip.captures[1] end ),
--t("\\Longleftrightarrow")},
--{condition = mathzone}
--),
	----------------------------------------
	---       Linear Algebra Env         ---
	----------------------------------------

-- ** Modifying this function may affect behaviour of helperfn.mat **
s(
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
{trig = "(%d);(%d)([%a]*)mat", regTrig = true, name = "matrix", dscr = "matrix trigger", snippetType= "autosnippet"},
fmt([[
\begin{<>}<>
<>
\end{<>}
]],
{
  f(matrix_type),
  f(function(_, snip)
    if snip.captures[3] == nil then
      return ""
    elseif string.match(snip.captures[3], "a") then
      local out = string.rep("c", tonumber(snip.captures[2]) - 1)
      return "[" .. out .. "|c]"
    else
      return ""
    end -- add funcitonaly 
  end),
  d(1, mat),
  f(matrix_type),
},
{delimiters = "<>"}
),
{condition = mathzone}
),



	s(
	{trig="lcross", snippetType="autosnippet"},
	fmta(
	[[
	\begin{vmatrix}
        \hat{i} & \hat{j} & \hat{k} \\
        <>  & <> & <> \\
		<> & <> & <> 
	\end{vmatrix}	
	]],
	{i(1), i(2), i(3), i(4), i(5), i(6)}
	),
    {condition = mathzone}
	),

	s(
	{trig=";3", snippetType="autosnippet"},
	fmta(
	[[
	\begin{bmatrix}
		<>  \\
		<> \\
		<> 
	\end{bmatrix}	
	]],
	{i(1), i(2), i(3)}
	),
    {condition = mathzone}
	),
    
    ----------------------------------------
    ---        Brackets                  ---
    ----------------------------------------
	s(
	{trig="rb", snippetType="autosnippet"},
    {t("\\roundbk{"), i(1), t("}"), i(0)},
    {condition = mathzone}
	), 

  s(
  {trig="cb", snippetType="autosnippet"},
  {t("\\curlybk{"), i(1), t("}"), i(0)},
  {condition = mathzone}
  ),

	s(
	{trig="abs", snippetType="autosnippet"},
    {t("\\abs{"), i(1), t("}"), i(0)},
    {condition = mathzone}
	),

	s(
	{trig="sb", snippetType="autosnippet"},
    {t("\\squarebk{"), i(1), t("}"), i(0)},
    {condition = mathzone}
	),

  s(
	{trig="norm", snippetType="autosnippet"},
	{t("\\norm{"), i(1), t("}"), i(0)},
  {condition = mathzone}
	),
	
    s(
	{trig="|", snippetType="autosnippet"},
	{t("\\big\\vert")},
    {condition = mathzone}
	),

    ----------------------------------------
    ---            Text                  ---
    ----------------------------------------
	s(
	{trig="break", snippetType="autosnippet"},
	{t("\\bigbreak "), t("\\noindent")}
	),

	s(
	{trig="textbf", snippetType="autosnippet"},
	{t("\\textbf{"), i(1), t("}"), i(0)},
    {condition = not_mathzone}
	),
	
    
  s(
	{trig="vsp", snippetType="autosnippet"},
	{t("\\vspace{1cm}")}
	),

  s(
	{trig="hsp", snippetType="autosnippet"},
	{t("\\hspace{0.5cm}")}
	),
  

  s(
	{trig="item", snippetType="autosnippet"},
	{t("\\item")},
  {condition = line_begin}
	),

  s(
  {trig="2;c", snippetType="autosnippet"},
  fmta(
  [[
  \begin{cases}
    <> & <>  \\
    <> & <> \\
  \end{cases}	
  ]],
  { i(1), i(2), i(3), i(4)}
  ),
    {condition = mathzone}
  ),
  
  s(
  {trig="3;c", snippetType="autosnippet"},
  fmta(
  [[
  \begin{cases}
    <> & <>  \\
    <> & <> \\
    <> & <> \\
  \end{cases}	
  ]],
  { i(1), i(2), i(3), i(4), i(5), i(6) }
  ),
    {condition = mathzone}
  ),
    -- Add visual selection for \underbrace{}_text{}
    -- multine line equations (gather*)
    -- could i have = expand to &= for align env
    -- is there a clean way to have assumtions tag
}
