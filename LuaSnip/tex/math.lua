local helpers = require('helperfn')
local mathzone = helpers.in_mathzone
-- consider add lim macro to make code more readable
return{
	-------------------------------------------
	---             Calculus                ---
	-------------------------------------------
	
	s(
	{ trig="(.)lim", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{ 
    f( function(_, snip) return snip.captures[1] end ),
    t("\\mlim{"), i(1), t("\\to"), i(2), t("}"), i(0)
    },
	{condition = mathzone}
	),

	s(
	{ trig="(.)o;i",wordTrig=false, regTrig=true, snippetType="autosnippet" }, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\oint ")
    },
    {condition = mathzone}
	),

	s(
	{ trig="(.);i",wordTrig=false, regTrig=true, snippetType="autosnippet" }, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\int_{"), i(1), t("}^{"), i(2), t("}"), i(0)
    },
    {condition = mathzone}
	),


	s(
	{ trig="(.)d;i", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\int_{"), i(1), t("}^{"), i(2), t("} \\int_{"),
	i(3), t("}^{"), i(4), t("}"), i(0)
    },
    {condition = mathzone}
	),

	s(
	{ trig="(.)t;i",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\int_{"), i(1), t("}^{"), i(2), t("} \\int_{"),
	i(3), t("}^{"), i(4), t("} "), t("\\int_{"),
	i(5), t("}^{"), i(5), t("}"), i(0)
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)ti;ei",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\iiint ")
    },
	{condition = mathzone}
	),

	s(
	{trig="(.)di;ei",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\iint ")
    },
	{condition = mathzone}
	),

	s(
	{trig="(.)i;i",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\int ")
    },
	{condition = mathzone}
	),

	-------------------------------------------
	---             Variables               ---
	-------------------------------------------

  	s(
	{ trig = "(.);a",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{ 
    f( function(_, snip) return snip.captures[1] end ),
    t("\\alpha ") 
    },
	{condition = mathzone}
	),

	s(
	{ trig = "(.);b",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\beta ") 
    },
	{condition = mathzone}
	),

	s(
	{trig=";e", snippetType="autosnippet"},
	{t("\\epsilon ")},
	{condition = mathzone}
	),

	s(
	{ trig = "(.);g",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{ 
    f( function(_, snip) return snip.captures[1] end ),
    t("\\gamma ") 
    },
	{condition = mathzone}
	),
	
    s(
	{trig="(.)u;g",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\Gamma ")
    },
	{condition = mathzone}
	),
	
	s(
	{trig="(.);m",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\mu ")
    },
	{condition = mathzone}
	),

	s(
	{trig="(.);l",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\lambda ")
    },
	{condition = mathzone}
	),

	s(
	{trig="(.)u;l",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\lambda ")
    },
	{condition = mathzone}
	),


	s(
	{trig="(.);t",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\theta ")
    },
    {condition = mathzone}
	),
	
	s(
	{trig="(.);s",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\sigma ")
    },
    {condition = mathzone}
	),


	s(
	{trig="(.)u;s",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\Sigma ")
    },
	{condition = mathzone}
	),

	s(
	{trig="(.);phi",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\varphi ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.);psi",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\psi ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.);z",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\zeta ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.);c",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\chi ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)u;d",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\Delta ")
    },
    {condition = mathzone}
	),
	
    s(
	{trig="(.);d",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\delta ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.);o",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\omega ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)u;t",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\Theta "),
    },
	{condition = mathzone}
	),
	
    s(
	{trig="xn", snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("x_n "),
    },
	{condition = mathzone}
	),
    
    s(
	{trig="yn", snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("y_n "),
    },
	{condition = mathzone}
	),
	
	
	-------------------------------------------
	---             Constants               ---
	-------------------------------------------
	

	s(
	{trig="(.)pp",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\pi ")
    },
	{condition = mathzone}
	),


	s(
	{ trig = "(.)inf",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\infty ") 
    },
	{condition = mathzone }
	),

	s(
	{ trig = "(.)ee",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\e^{"), i(1), t("}")
    },
	{condition = mathzone }
	),


	-------------------------------------------
	---             Functions               ---
	-------------------------------------------

	s(
	{trig="(.)floor",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\lfloor"), i(1), t("\\rfloor"), i(0)
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)ceil",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\lceil"), i(1), t("\\rceil"), i(0)
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)sum",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\sum"),t("\\limits_{"), i(1), t("}^{"), i(2), t("}"), i(0)},
    {condition = mathzone}
	),

	s(
	{trig="(.)sin",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\sin ")
    },
	{condition = mathzone}
	),

	s(
	{trig="(.)cos",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\cos ")
    },
	{condition = mathzone}
	),

	s(
	{trig="(.)tan",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\tan ")
    },
	{condition = mathzone}
	),


	s(
	{trig="(.)asin",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\arcsin ")
    },
	{condition = mathzone}
	),


	s(
	{trig="(.)arctan",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\arctan ")
    },
	{condition = mathzone}
	),

	s(
	{trig="(.)csc",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\csc ")
    },
	{condition = mathzone}
	),


	s(
	{trig="(.)log",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\log")
    },
	{condition = mathzone}
	),

	s(
	{trig="(.)ln",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\ln ")
    },
	{condition = mathzone}
	),

	s(
	{trig="(.)sinh",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\sinh ")
    },
	{condition = mathzone}
	),


	s(
	{trig="(.)cosh",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\cosh ")
    },
	{condition = mathzone}
	),

	s(
	{trig="(.)tanh",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\tanh ")
    },
	{condition = mathzone}
	),

	s(
	{trig="(.)aa",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\sqrt{"), i(1), t("}"), i(0)
    },
	{condition = mathzone}
	),


	s(
	{trig="(.)naa",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\sqrt["), i(1), t("] {"), i(2), t("} ")
    },
	{condition = mathzone}
	),

	-------------------------------------------
	---          Math Specific Formatting    ---
	-------------------------------------------

	s(
	{trig="(.)uu",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t('^{'), i(1), t('}'), i(0)
    },
	{condition = mathzone}
	),

	s(
	{trig="(.)dd",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("_{"), i(1), t("}"), i(0)
    },
	{condition = mathzone}
	),

	s(
	{trig="(.)du",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("_{"), i(1), t("}^{"), i(2), t("}"), i(0)
    },
	{condition = mathzone}
	),
    
	s(
	{trig="([%a])([%d])",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("_"),
    f( function(_, snip) return snip.captures[2] end ),
    },
	{condition = mathzone}
	),

	s(
	{trig="(.)ff",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0)
    },
	{condition = mathzone}
	),
	
    s(
	{trig="(.)hd",wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\dots ")
    },
	{condition = mathzone}
	),

	-------------------------------------------
	---          Common Sequences           ---
	-------------------------------------------
--	s(
--	{trig="aaa", snippetType="autosnippet"}, 
--	{t("a_0, a_1, a_2, \\ldots, a_{"), i(1), t("}")},
--	{condition = mathzone}
--	),

--	s(
--	{trig="jj", snippetType="autosnippet"}, 
--	{t("\\ldots")},
--	{condition = mathzone}
--	),

	-------------------------------------------
	---          Logic Symbols             ---
	-------------------------------------------

	s(
	{trig="(.)neq", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\not= ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)\\", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\setminus ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)le", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\le ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)ge", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\ge ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.);=", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\approx ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)~", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\thicksim ")
    },
	{condition = mathzone}
	),

	s(
	{trig="(.)nin", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\notin ")
    },
    {condition = mathzone}
	),

	-------------------------------------------
	---          Set Symbols                ---
	-------------------------------------------
	s(
	{trig="(.)cup", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\bigcup ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)cap", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\bigcap ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)ss", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\mathbb{"), i(1), t("}")
    },
    {condition = mathzone}
	),
    
    s(
	{trig="(.)inn", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\in ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)sub", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\subset ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)esub", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\subseteq ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)set", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\{"), i(1), t("\\}")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)forall", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\forall ")
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)exists", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\exists ")
    },
    {condition = mathzone}
	),

	-------------------------------------------
	---     Linear Algebra Symbols          ---
	-------------------------------------------

	-------------------------------------------
	---             Operators              ---
	-------------------------------------------

	s(
	{trig="(.)partial", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\partial")
    },
    {condition = mathzone}
	),	

	s(
	{trig="(.)im", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\operatorname{Im}"), t("("), i(1), t(")"), i(0)
    },
    {condition = mathzone}
	),	


	s(
	{trig="(.)re", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\operatorname{Re}"), i(1), t("("), i(1), t(")"), i(0)
    },
    {condition = mathzone}
	),	
	
    s(
	{trig="(.)ker", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\operatorname{Ker}"), i(1), t("("), i(1), t(")"), i(0)
    },
    {condition = mathzone}
	),	

	s(
	{trig="(.)grad", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\grad ")
    },
    {condition = mathzone}
	),	
	
--    s(
--	{trig="(.)grad", wordTrig=false, regTrig=true, snippetType="autosnippet"},
--	{
--    f( function(_, snip) return snip.captures[1] end ),
--    t("\\grad")
--    },
--    {condition = mathzone}
--	),	

	s(
	{trig="(.)dot", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\cdot ")
    },
    {condition = mathzone}
	),
    
	s(
	{trig="(.)inv", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("^{-1}")
    },
    {condition = mathzone}
	),
	
    s(
	{trig="(.)sinv", wordTrig=false, regTrig=true, snippetType="autosnippet"},
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("^\\dagger ")
    },
    {condition = mathzone}
	),
	-------------------------------------------
	---          Variable Symbols          ---
	-------------------------------------------

	s(
	{trig="(.)hat", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\widehat{"), i(1), t("}"), i(0),
    },
    {condition = mathzone}
	),

	s(
	{trig="(.)bar", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\overline{"), i(1), t("}"), i(0)
    },
    {condition = mathzone}
	),


	s(
	{trig="(.)vv", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
	{
    f( function(_, snip) return snip.captures[1] end ),
    t("\\vec{"), i(1), t("}"), i(0)
    },
    {condition = mathzone}
	),


--	s(
--	{trig="larrow", snippetType="autosnippet"},
--	{t("\\vec{"), i(1), t("} ")}
--	),
--
--	s(
--	{trig="", snippetType="autosnippet"}, 
--	{t("\\Leftarrow ")}
--	),







}


