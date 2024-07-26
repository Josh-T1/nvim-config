local helpers = require('luasnip_helpers')
local ls = require("luasnip")
local mathzone = helpers.in_mathzone
local not_mathzone = helpers.not_mathzone

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node
--local fmta = require("luasnip.extras.fmt").fmta
-- consider add lim macro to make code more readable
return{
	-------------------------------------------
	---             Calculus                ---
	-------------------------------------------
  s(
	{trig="te", wordTrig=true, regTrig=false, snippetType="snippet"},
	{
    t("test")
  },
	{condition = mathzone}
	),


s(
{ trig="text", wordTrig=true, regTrig=false, snippetType="snippet" },
{
  t("\\text{"), i(1), t("}")
  },
{condition = mathzone}
),

s(
{ trig="eset", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\emptyset")
  },
{condition = mathzone}
),

s(
{ trig="map", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\mapsto ")
  },
{condition = mathzone}
),

s(
{ trig="perp", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{ 
  t("\\perp ")
  },
{condition = mathzone}
),

s(
{ trig="([^%w])sup", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{ 
  f( function(_, snip) return snip.captures[1] end ),
  t("\\sup")
  },
{condition = mathzone}
),

s(
{ trig = "([^%w])ii",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  f( function(_, snip) return snip.captures[1] end ),
  t("\\infty")
  },
{condition = mathzone }
),

s(
{ trig="lsup", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\limsup")
  },
{condition = mathzone}
),

s(
{ trig="<<", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\anglebk{"), i(1),t(","), i(2), t("}")
  },
{condition = mathzone}
),

s(
{ trig="max", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{ 
  t("\\max")
  },
{condition = mathzone}
),

s(
{ trig="min", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{ 
  t("\\min")
  },
{condition = mathzone}
),

s(
{ trig="blim", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{ 
  t("\\limits_{"), i(1), t("}"), i(0)
  },
{condition = mathzone}
),

s(
{ trig="[^%w]lim", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  f( function(_, snip) return snip.captures[1] end ),
  t("\\mlim{"), i(1), t("\\to"), i(2), t("}"), i(0)
  },
{condition = mathzone}
),

s(
{ trig="nlim", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{ 
  t("\\mlim{n\\to\\infty}")
  },
{condition = mathzone}
),

s(
{ trig="o;i",wordTrig=false, regTrig=true, snippetType="autosnippet" }, 
{
  t("\\oint ")
  },
  {condition = mathzone}
),

s(
{ trig=";i",wordTrig=false, regTrig=true, snippetType="autosnippet" }, 
{
  t("\\int_{"), i(1), t("}^{"), i(2), t("}"), i(0)
  },
  {condition = mathzone}
),


s(
{ trig="d;i", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\int_{"), i(1), t("}^{"), i(2), t("} \\int_{"),
  i(3), t("}^{"), i(4), t("}"), i(0)
  },
  {condition = mathzone}
),

s(
{ trig="t;i",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
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
{ trig = "(.)u;b",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  f( function(_, snip) return snip.captures[1] end ),
  t("\\mathcal{B} ") 
  },
{condition = mathzone}
),


s(
{trig=";(%a)", regTrig = true, wordTrig = false, snippetType="autosnippet"},
{
  d(1, function(args, parent, old_state, user_args)

    local default_value = ";" 
    if parent and #parent.captures >= 1 then
      default_value = ";" .. parent.captures[1] .. "missing"
    end

    local metatable = {
      __index = function(_, key)
        return default_value
      end
    }

    local my_dict = {
      a = "\\alpha", ua = "\\Alpha",
      b = "\\beta", ub = "\\Beta",
      c = "\\chi",
      d = "\\delta", ud = "\\Delta",
      e = "\\epsilon",
--      f = "",
      g = "\\gamma", ug = "\\Gamma",
--      h = "",
--      i = "",
--      j = "",
--      k = "",
      l = "\\lambda", ul = "\\Lambda",
      m = "\\mu", 
--      n = "",
      o = "\\omega", uo = "\\Omega",
      p = "\\psi",
--      q = "",
--      r = "",
      s = "\\sigma", us = "\\Sigma",
      theta = "\\theta", utheta = "\\Theta", tau = "\\tau",
--      u = "",
      v = "\\varphi",
--      w = "",
--      x = "",
--      y = "",
      z = "\\zeta"
    }
    setmetatable(my_dict, metatable)
    return sn(nil, {
      t(my_dict[parent.captures[1]])
    })
  end)
},
{condition = mathzone}
),


--s(
--{trig="([^%s]);d",wordTrig=false, regTrig=true, snippetType="autosnippet"},
--{
--  t("\\delta ")
--  },
--  {condition = mathzone}
--),



--s(
--{trig="([%a&[^i]])n", snippetType="autosnippet", wordTrig=false, regTrig=true}, 
--{
--  f( function(_, snip) return snip.captures[1] end ),
--  t("_n"),
--  },
--{condition = mathzone}
--),
  
--  s(
--{trig="yn", snippetType="autosnippet"}, 
--{
--  f( function(_, snip) return snip.captures[1] end ),
--  t("y_n "),
--  },
--{condition = mathzone}
--),
	
	
	-------------------------------------------
	---             Constants               ---
	-------------------------------------------
	

s(
{trig="pp",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\pi ")
  },
{condition = mathzone}
),

s(
{ trig = "infty",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\infty ") 
  },
{condition = mathzone }
),

s(
{ trig = "ee",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("e^{"), i(1), t("}")
  },
{condition = mathzone }
),


-------------------------------------------
---             Functions               ---
-------------------------------------------

s(
{trig="floor",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\lfloor"), i(1), t("\\rfloor"), i(0)
  },
  {condition = mathzone}
),

s(
{trig="ceil",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\lceil"), i(1), t("\\rceil"), i(0)
  },
  {condition = mathzone}
),

s(
{trig="sum",wordTrig=true, regTrig=false, snippetType="snippet"},
{ 
  c(1, {
  t("\\sum\\limits_{n=0}^{\\infty}"),
  t("\\sum"),
  t("\\sum\\limits_{n=0}^{N}"),
})
  },
  {condition = mathzone}
),


-- s(
-- {trig="([^%w])sum",wordTrig=false, regTrig=true, snippetType="autosnippet"},
-- {
--  f( function(_, snip) return snip.captures[1] end ),
--  t("\\sum"),t("\\limits_{"), i(1), t("}^{"), i(2), t("}"), i(0)},
--  {condition = mathzone}
-- ),
-- 
-- s(
-- {trig="nsum",wordTrig=false, regTrig=true, snippetType="autosnippet"},
-- { t("\\sum\\limits_{n=1}^{\\infty}") },
--  {condition = mathzone}
-- ),
 s(
 {trig="fn",wordTrig=false, regTrig=true, snippetType="autosnippet"},
 { t("f_{n}") },
  {condition = mathzone}
 ),
 
-- s(
-- {trig="zsum",wordTrig=false, regTrig=true, snippetType="autosnippet"},
-- { t("\\sum\\limits_{n=0}^{\\infty}") },
--  {condition = mathzone}
-- ),
--
-- s(
-- {trig="lsum",wordTrig=false, regTrig=true, snippetType="autosnippet"},
-- {
--  t("\\sum "),
-- },
--  {condition = mathzone}
--),

s(
{trig="sin",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\sin ")
  },
{condition = mathzone}
),



s(
{trig="cos",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\cos ")
  },
{condition = mathzone}
),

s(
{trig="tan",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\tan ")
  },
{condition = mathzone}
),


s(
{trig="arsin",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\arcsin ")
  },
{condition = mathzone}
),


s(
{trig="arctan",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\arctan ")
  },
{condition = mathzone}
),

s(
{trig="csc",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\csc ")
  },
{condition = mathzone}
),


s(
{trig="log",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\log")
  },
{condition = mathzone}
),

s(
{trig="ln",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\ln ")
  },
{condition = mathzone}
),

s(
{trig="sinh",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\sinh ")
  },
{condition = mathzone}
),


s(
{trig="cosh",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\cosh ")
  },
{condition = mathzone}
),

s(
{trig="tanh",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\tanh ")
  },
{condition = mathzone}
),


s(
{trig="(.)root", regTrig = true, wordTrig = false, snippetType="autosnippet"},
{
  d(1, function(args, parent, old_state, user_args)
    local capture = parent.captures[1]
    if capture == 'n' then
      return sn(nil, {t(capture), t("\\sqrt["), t("n] {"), i(1), t("} "), i(0)})

    elseif capture:match("%d") ~= nil then
      return sn(nil, {t("\\sqrt["), t(capture .. "] {"), i(1), t("} "), i(0)})

    else
      return sn(nil, {t("\\sqrt{"), i(1), t("}"), i(0)})

    end
  end)
},
{condition = mathzone}
),

-------------------------------------------
---          Math Specific Formatting    ---
-------------------------------------------

s(
{trig="uu",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t('^{'), i(1), t('}'), i(0)
  },
{condition = mathzone}
),

s(
{trig="([%w%s%}])dd",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  f( function(_, snip) return snip.captures[1] end ),
  t("_{"), i(1), t("}"), i(0)
  },
{condition = mathzone}
),

s(
{trig="([^%w])du",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("_{"), i(1), t("}^{"), i(2), t("}"), i(0)
  },
{condition = mathzone}
),
  
s(
{trig="ndu",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("_{n=1}^{\\infty}")
  },
{condition = mathzone}
),

s(
{trig="([^%a])([%a])([%d])",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  f( function(_, snip) return snip.captures[1] end ),
  f( function(_, snip) return snip.captures[2] end ),
  t("_"),
  f( function(_, snip) return snip.captures[3] end ),
  },
{condition = mathzone}
),

s(
{trig="ff",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{ 
  f( function(_, snip) return snip.captures[1] end ),
  t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0)
  },
{condition = mathzone}
),

-- s(
-- {trig="ff",wordTrig=false, regTrig=true, snippetType="autosnippet"},
-- { 
  -- d(1, function(args, parent, old_state, user_args)
   -- local capture = parent.caputures[1]
  -- end),
 -- f( function(_, snip) return snip.captures[1] end ),
 -- t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0)
 -- },
-- {condition = mathzone}
-- ),

s(
{trig="o%+",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\oplus")
  },
{condition = mathzone}
),

s(
{trig="([%s])([%a])%.%.",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  f( function(_, snip) return snip.captures[1] end ),
  f( function(_, snip) return snip.captures[2] end ), t("_1, "),
  f( function(_, snip) return snip.captures[2] end ), t("_2,\\dots, "),
  f( function(_, snip) return snip.captures[2] end ), t("_")
  },
{condition = mathzone}
),

--s(
--{trig="([^%a])([%a])%+%.%.",wordTrig=false, regTrig=true, snippetType="autosnippet"},
--{
--  f( function(_, snip) return snip.captures[1] end ),
--  f( function(_, snip) return snip.captures[2] end ), t("_1 + "),
--  f( function(_, snip) return snip.captures[2] end ), t("_2 + \\dots + "),
--  f( function(_, snip) return snip.captures[2] end ), t("_")
--},
--{condition = mathzone}
--),


s(
{trig="(\\)([%a]+)(|)([%a])%.%.",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\"),
  f( function(_, snip) return snip.captures[2] end ), t("_1 "),
  f( function(_, snip) return snip.captures[4] end ), t("_1 ...\\"),
  f( function(_, snip) return snip.captures[2] end ), t("_"), rep(1), t(" "),
  f( function(_, snip) return snip.captures[4] end ), t("_"), i(1)
},
{condition = mathzone}
),

s(
{trig="([%a])(|)(\\)([%a]+)%.%.", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  f( function(_, snip) return snip.captures[1] end ), t("_1 \\"),
  f( function(_, snip) return snip.captures[4] end ), t("_1 ...\\"),
  f( function(_, snip) return snip.captures[1] end ), t("_"), rep(1), t(" "),
  f( function(_, snip) return snip.captures[4] end ), t("_"), i(1)
},
{condition = mathzone}
),

s(
{trig="([%a])>%.%.",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\vec{"), f( function(_, snip) return snip.captures[1] end ), t("}_1, "),
  t("\\vec{"), f( function(_, snip) return snip.captures[1] end ), t("}_2,\\dots, "),
  t("\\vec{"), f( function(_, snip) return snip.captures[1] end ), t("}_{"), i(1), t("}")
  },
{condition = mathzone}
),

s(
{trig="([^%a])([%a])([%a])%.%.",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{ 
  f( function(_, snip) return snip.captures[1] end ),
  f( function(_, snip) return snip.captures[2] end ),
  t("_1\\vec{"), f( function(_, snip) return snip.captures[3] end ), t("}_1,...,"),
  f( function(_, snip) return snip.captures[2] end ),
  t("_n\\vec{"), f( function(_, snip) return snip.captures[2] end ), t("}_{"), i(1), t("}")
  },
{condition = mathzone}
),

s(
{trig="([%a])([%a])([%a])(r)%.%.",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{ t("("), f( function(_, snip) return snip.captures[1] end ), t("_1 +"),
  f( function(_, snip) return snip.captures[2] end ), t("_1 )"),
  t("\\vec{"), f( function(_, snip) return snip.captures[3] end ), t("}_1,...,("),
  f( function(_, snip) return snip.captures[1] end ), t("_n +"),
  f( function(_, snip) return snip.captures[2] end ), t("_n)"),
  t("\\vec{"), f( function(_, snip) return snip.captures[3] end ), t("}_n")
  },
{condition = mathzone}
),

s(
{trig="([%a])basis",wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\curlybk{"),
  t("\\vec{"), f( function(_, snip) return snip.captures[1] end ), t("}_1,...,"),
  t("\\vec{"), f( function(_, snip) return snip.captures[1] end ), t("}_"), i(1), t("}")
  },
{condition = mathzone}
),

s(
{trig='([^%a])(\\)([%a]+)%.%.',wordTrig=false, regTrig=true, snippetType="autosnippet"},
{ 
  f( function(_, snip) return snip.captures[1] end ),
  t("\\"), f( function(_, snip) return snip.captures[3] end ), t("_1"),
  t(",...,\\"), f( function(_, snip) return snip.captures[3] end ), t("_n")
},
{condition = mathzone}
),

--s(
--{trig='(\\)(.+)%+%.%.',wordTrig=false, regTrig=true, snippetType="autosnippet"},
--{ 
--  t("\\"), f( function(_, snip) return snip.captures[2] end ),
--  t(",...,")
--},
--{condition = mathzone}
--),


s(
{trig="+-", snippetType="autosnippet"},
{
  t("\\pm ")
  },
  {condition = mathzone}
),

s(
{trig="-+", snippetType="autosnippet"},
{
  t("\\mp ")
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
{trig="neq", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\not= ")
  },
  {condition = mathzone}
),

s(
{trig="\\\\\\", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\setminus ")
  },
  {condition = mathzone}
),

s(
{trig="le", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\le ")
  },
  {condition = mathzone}
),

s(
{trig="ge", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\ge ")
  },
  {condition = mathzone}
),

s(
{trig=";=", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\approx ")
  },
  {condition = mathzone}
),

s(
{trig="~", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\thicksim ")
  },
{condition = mathzone}
),

s(
{trig="nin", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\notin ")
  },
  {condition = mathzone}
),

-------------------------------------------
---          Set Symbols                ---
-------------------------------------------
s(
{trig="cup", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
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
{trig="bb", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\mathbb{"), i(1), t("}")
  },
  {condition = mathzone}
),
s(

{trig="cc", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  t("\\mathcal{"), i(1), t("}")
  },
  {condition = mathzone}
),
  
s(
{trig="inn", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\in ")
  },
  {condition = mathzone}
),

s(
{trig="to", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\to ")
  },
  {condition = mathzone}
),

s(
{trig="psub", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\subset ")
  },
  {condition = mathzone}
),

s(
{trig="sub", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\subseteq ")
  },
  {condition = mathzone}
),

s(
{trig="([^%a])set", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  f( function(_, snip) return snip.captures[1] end ),
  t("\\{"), i(1), t("\\}")
  },
  {condition = mathzone}
),

s(
{trig="forall", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\forall ")
  },
  {condition = mathzone}
),

s(
{trig="ex", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\exists ")
  },
  {condition = mathzone}
),

-------------------------------------------
---     Linear Algebra Symbols          ---
-------------------------------------------

-------------------------------------------
---             Operators? THis is a bad name              ---
-------------------------------------------

s(
{trig="(.)partial", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
  f( function(_, snip) return snip.captures[1] end ),
  t("\\partial")
  },
  {condition = mathzone}
),	
-----------------------
--- Operatorname ---
--------------------
s(
{trig="(.)im", wordTrig=false, regTrig=true, snippetType="snippet"},
{
f( function(_, snip) return snip.captures[1] end ),
t("\\operatorname{Im}"), i(1)
},
{condition = mathzone}
),	

--s(
--{trig="(.)range", wordTrig=false, regTrig=true, snippetType="autosnippet"},
--{
--f( function(_, snip) return snip.captures[1] end ),
--t("\\(\\operatorname{Range}"), i(1), t("\\)")
--},
--{condition = mathzone}
--),	

s(
{trig="(.)Re", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
f( function(_, snip) return snip.captures[1] end ),
t("\\operatorname{Re}"), i(1)
},
{condition = mathzone}
),	


s(
{trig="(.)ker", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
f( function(_, snip) return snip.captures[1] end ),
t("\\operatorname{ker}("), i(1), t(")"), i(0)
},
{condition = mathzone}
),	

s(
{trig="(.)range", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
f( function(_, snip) return snip.captures[1] end ),
t("\\text{ran }("), i(1), t(")"), i(0)
},
{condition = mathzone}
),	

s(
{trig="dim", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
t("\\dim ")
},
{condition = mathzone}
),	


--s(
--{trig="(.)Det", wordTrig=false, regTrig=true, snippetType="autosnippet"},
--{
--f( function(_, snip) return snip.captures[1] end ),
--t("\\(\\operatorname{Det}"), i(1), t("\\)"), i(0)
--},
--{condition = not_mathzone}
--),	

s(
{trig="(.)det", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
f( function(_, snip) return snip.captures[1] end ),
t("\\operatorname{det}("), i(1), t(")"), i(0)
},
{condition = mathzone}
),	

--s(
--{trig="(.)Tr", wordTrig=false, regTrig=true, snippetType="autosnippet"},
--{
--f( function(_, snip) return snip.captures[1] end ),
--t("\\(\\operatorname{Tr}"), i(1), t("\\)"), i(0)
--},
--{condition = not_mathzone}
--),	

s(
{trig="(.)Tr", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
f( function(_, snip) return snip.captures[1] end ),
t("\\operatorname{Tr}"), i(1), i(0)
},
{condition = mathzone}
),	

s(
{trig="span", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
t("\\operator{Span}\\curlybk{"), i(1), t("}"), i(0)
},
{condition = mathzone}
),	

--s(
--{trig="(.)Span", wordTrig=false, regTrig=true, snippetType="autosnippet"},
--{
--f( function(_, snip) return snip.captures[1] end ),
--t("\\(\\operatorname{Span}"), i(1), t("\\)"), i(0)
--},
--{condition = not_mathzone}
--),	

s(
{trig="(.)diag", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
f( function(_, snip) return snip.captures[1] end ),
t("\\operatorname{diag}"),t("("), i(1), t(")"), i(0)
},
{condition = mathzone}
),	

--s(
--{trig="(.)Diag", wordTrig=false, regTrig=true, snippetType="autosnippet"},
--{
--f( function(_, snip) return snip.captures[1] end ),
--t("\\(\\operatorname{Diag}"),t("\\curlybk{"), i(1), t("}\\)"), i(0)
--},
--{condition = not_mathzone}
--),	

s(
{trig="(.)null", wordTrig=false, regTrig=true, snippetType="autosnippet"},
{
f( function(_, snip) return snip.captures[1] end ),
t("\\operatorname{null}"),
},
{condition = mathzone}
),	


s(
{trig="nullity", snippetType="autosnippet"},
{
t("\\text{nullity }")
},
{condition = mathzone}
),	

s(
{trig="rank", snippetType="autosnippet"},
{
t("\\text{rank }")
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
{trig="([^%a])dot", wordTrig=false, regTrig=true, snippetType="autosnippet"},
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


--s(
--{trig="(.)hat", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
--{
--  f( function(_, snip) return snip.captures[1] end ),
--  t("\\widehat{"), i(1), t("}"), i(0),
--  },
--  {condition = mathzone}
--),

s(
{trig="(.)bar", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  f( function(_, snip) return snip.captures[1] end ),
  t("\\overline{"), i(1), t("}"), i(0)
  },
  {condition = mathzone}
),

s(
{trig="tilde", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  f( function(_, snip) return snip.captures[1] end ),
  t("\\tilde{"), i(1), t("}"), i(0)
  },
  {condition = mathzone}
),


s(
{trig="%.([%a])", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  t("\\vec{"),
  f( function(_, snip) return snip.captures[1] end ),
   t("}")
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

-------------------------------------------
---          Text Zone          ---
-------------------------------------------
s(
{trig="([^%.])(.)([%u])([%s%p])", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
{
  f( function(_, snip) return snip.captures[1] end ),
  f( function(_, snip) return snip.captures[2] end ), t("\\("),
  f( function(_, snip) return snip.captures[3] end ), t("\\)"),
  f( function(_, snip) return snip.captures[4] end ),
  },
  {condition = not_mathzone}
),
-- this handles the case where . A should not expand but if [%u] < 3 spaces from line begin then nothing happens

  s(
  {trig="([%u]):([%u])([%u])", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
  t("\\("),
  f( function(_, snip) return snip.captures[1] end ), t(": "),
  f( function(_, snip) return snip.captures[2] end ), t(" \\to "),
  f( function(_, snip) return snip.captures[3] end ), t("\\)")
  },
  {condition = not_mathzone}
  ),

  s(
  {trig="([%u]):([%u])([%u])", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
  f( function(_, snip) return snip.captures[1] end ), t(": "),
  f( function(_, snip) return snip.captures[2] end ), t(" \\to "),
  f( function(_, snip) return snip.captures[3] end )
  },
  {condition = mathzone}
  ),
  
 s(
 {trig="([%a])seq", snippetType="autosnippet"}, 
 { t("\\curlybk{"),
  f( function(_, snip) return snip.captures[1] end ),
  t("_n}_{n \\in \\mathbb{N}}")}
 ),

}


