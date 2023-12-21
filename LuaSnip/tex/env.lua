local line_begin = require("luasnip.extras.expand_conditions").begin_line
local helper = require("helperfn")
local mathzone = helper.mathzone
local not_mathzone = helper.not_mathzone
-- add norm
return {
	----------------------------------------
	---            Math Env              ---
	----------------------------------------
    s(
	{trig="section", snippetType="autosnippet"},
    {t("\\section{"), i(1), t("}")},
    {condition = line_begin}
	),

	s(
	{trig="dd", snippetType="autosnippet"},
	fmta(
	[[
		\begin{Definiton*}{(<>)}{}
		<>
		\end{Definition*}
	]],
	{
		i(1),
        i(2)
	}
	),
	{condition = line_begin}
	),

	s(
	{trig="tt", snippetType="autosnippet"},
	fmta(
	[[
		\begin{Theorem*}{(<>)}{<>}
		<>
		\end{Theorem*} \vspace{1cm}
	]],
	{
		i(1),
        rep(1),
        i(2)
	}
	),
	{condition = line_begin}
	),
	
	s(
	{trig="bb", snippetType="autosnippet"},
	fmta(
	[[
		\begin{<>}
		<>
		\end{<>}
	]],
	{
		i(1),
		i(2),
		rep(1),
	}
	),
	{condition = line_begin}
	),
	
	s(
	{trig="eb", snippetType="autosnippet"}, 
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
	{trig="lb", snippetType="autosnippet"}, 
	fmta(
	[[
		\begin{enumerate}
		\item <>
		\end{enumerate}
	]],
	{
		i(1),
	}
	),
	{condition = line_begin}
	),

	----------------------------------------
	---            Text Env              ---
	----------------------------------------
	
	s(
	{trig="(.);", wordTrig=false, regTrig=true,
	snippetType="autosnippet"}, 
	{ 
    f( function(_, snip) return snip.captures[1] end ),
	t("\\("), i(1), t("\\)"),
    },
	{condition = not_mathzone}
	),
	
	s(
	{trig="([%s])t;", wordTrig=false, regTrig=true,
	snippetType="autosnippet"},
	{f( function(_, snip) return snip.captures[1] end ),
	t("\\text{"), i(1), t("}")},
	{condition = mathzone}
	),
	
    s(
	{trig="([%s])iff", wordTrig=false, regTrig=true,
	snippetType="autosnippet"},
	{f( function(_, snip) return snip.captures[1] end ),
	t("\\(\\Longleftrightarrow\\)")},
	{condition = not_mathzone}
	),

	----------------------------------------
	---       Linear Algebra Env         ---
	----------------------------------------

	s(
	{trig="2;2", snippetType="autosnippet"},
	fmta(
	[[
	\begin{bmatrix}
		<> & <> \\ 
		<> & <>
	\end{bmatrix}	
	]],
	{
		i(1),
		i(2), 
		i(3), 
		i(4),
	}
	),
    {condition = mathzone}
	),


	s(
	{trig=";2", snippetType="autosnippet"},
	fmta(
	[[
	\begin{bmatrix}
		<>  \\ 
		<> 
	\end{bmatrix}	
	]],
	{
		i(1),
		i(2), 
	}
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
	{
		i(1),
		i(2),
		i(3),
		i(4),
		i(5),
		i(6),
	}
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
	{
		i(1),
		i(2),
		i(3),
	}
	),
    {condition = mathzone}
	),
    
    ----------------------------------------
    ---        Brackets                  ---
    ----------------------------------------
	s(
	{trig="r;b", snippetType="autosnippet"},
    {t("\\roundbk{"), i(1), t("}"), i(0)},
    {condition = mathzone}
	), 
         
    s(
    {trig="c;b", snippetType="autosnippet"},
    {t("\\curlybk{"), i(1), t("}"), i(0)},
    {condition = mathzone}
    ),

	s(
	{trig="a;b", snippetType="autosnippet"},
    {t("\\abs{"), i(1), t("}"), i(0)},
    {condition = mathzone}
	),

	s(
	{trig="s;b", snippetType="autosnippet"},
    {t("\\sqaurebk{"), i(1), t("}"), i(0)},
    {condition = mathzone}
	),
	
    s(
	{trig="v;b", snippetType="autosnippet"},
	{t("\\left "), t("\\langle "), i(1), t("\\right "), t("\\rangle")},
    {condition = mathzone}
	),
    
    s(
	{trig="n;b", snippetType="autosnippet"},
	{t("\\norm{"), i(1), t("}"), i(0)},
    {condition = mathzone}
	),
	
    s(
	{trig="vert", snippetType="autosnippet"},
	{t("\\Big\\vert")},
    {condition = mathzone}
	),

    ----------------------------------------
    ---            Text                  ---
    ----------------------------------------
	s(
	{trig="f;n", snippetType="autosnippet"},
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
	{trig="item", snippetType="autosnippet"},
	{t("\\item")},
    {condition = mathzone}
	),

    -- Add visual selection for \underbrace{}_text{}
    -- multine line equations (gather*)
    -- could i have = expand to &= for align env
    -- is there a clean way to have assumtions tag
    -- add maps to \longmapsto
    -- add peice wise funciton support (cases)
    --
}
