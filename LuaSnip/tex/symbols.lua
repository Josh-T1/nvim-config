local helpers = require('luasnip_helpers')
local ls = require("luasnip")
local mathzone = helpers.in_mathzone
local not_mathzone = helpers.not_mathzone
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node
local sn = ls.snippet_node
local fmta = ls.fmta
return{
  s(
  {trig=";(%a)", regTrig = true, wordTrig = false, snippetType="autosnippet"},
  {
    d(1, function(args, parent, old_state, user_args)

      local default_value = ";" 
      if parent and #parent.captures >= 1 then
        default_value = ";" .. parent.captures[1]
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

  s(
  {trig="o%+",wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    t("\\oplus")
    },
  {condition = mathzone}
  ),

  s(
  {trig="%+%-", snippetType="autosnippet"},
  {
    t("\\pm ")
    },
    {condition = mathzone}
  ),

  s(
  {trig="%-%+", snippetType="autosnippet"},
  {
    t("\\mp ")
    },
    {condition = mathzone}
  ),
  s(
  {trig="neq", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    t("\\not= ")
    },
    {condition = mathzone}
  ),

  s(
  {trig="\\\\", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    t("\\setminus")
    },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a])le", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\le")
    },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a])ge", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\ge")
    },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a])app", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\approx")
    },
    {condition = mathzone}
  ),

  s(
  {trig="~", wordTrig=true, regTrig=false, snippetType="autosnippet", description="Command for ~ symbol"},
  {
    t("\\thicksim")
    },
  {condition = mathzone}
  ),

  s(
  {trig="([^%a])nin", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\notin")
    },
    {condition = mathzone}
  ),

  -------------------------------------------
  ---          Set Symbols                ---
  -------------------------------------------
  s(
  {trig="([^%a])cup", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\bigcup")
    },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a])cap", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\bigcap")
    },
    {condition = mathzone}
  ),

  s(
  {trig="b([%u])", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    t("\\mathbb{"),
    f( function(_, snip) return snip.captures[1] end ),
    t("}")
    },
    {condition = mathzone}
  ),
  
  s(
  {trig="c([%u])", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    t("\\mathcal{"),
    f( function(_, snip) return snip.captures[1] end ),
    t("}")
    },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a])cal", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\mathcal{"), i(1), t("}")
    },
    {condition = mathzone}
  ),
    
  s(
  {trig="([^%a])inn", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\in ")
    },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a])to", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\to")
    },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a])psub", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\subset")
    },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a])sub", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip) return snip.captures[1] end ),
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
  {trig="([^%a])forall", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\forall ")
    },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a])ex", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\exists")
    },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a])uto", snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\uto{"), i(1), t("}")
  },
  {condition = mathzone}
	),

  s(
  {trig="([^%a])bto", snippetType="autosnippet", description="text on underside of arrow",
  },
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\bto{"), i(1), t("}")
  },
  {condition = mathzone}
	),

  s(
	{trig="|", snippetType="autosnippet"},
	{t("\\big\\vert")},
    {condition = mathzone}
	),

  s(
  { trig="([^%a])eset", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\emptyset")
    },
  {condition = mathzone}
  ),

  s(
  { trig="([^%a])map", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\mapsto ")
    },
  {condition = mathzone}
  ),

  s(
  { trig="([^%a])perp", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  { 
    f( function(_, snip) return snip.captures[1] end ),
    t("\\perp ")
    },
  {condition = mathzone}
  ),

  s(
  { trig = "([^%a])inf",wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\infty")
    },
  {condition = mathzone }
  ),

  s(
  {trig="([^%a])pp",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\pi ")
    },
  {condition = mathzone}
  ),
  
  s(
  {trig="([^%a])partial", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\partial")
    },
    {condition = mathzone}
  ),
  
  s(
  {trig="([^%a])diff", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\diff")
    },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a])grad", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\grad ")
    },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a])dot", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\cdot ")
    },
    {condition = mathzone}
  ),


  s(
  {trig="([^%a])iff", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
  f( function(_, snip) return snip.captures[1] end ),
  t("\\(\\leftrightarrow\\)")
  },
  {condition = not_mathzone}
  ),
  -- TODO
  s(
  {trig="([^%a])if", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
  f( function(_, snip) return snip.captures[1] end ),
  t("\\Longleftrightarrow")
  },
  {condition = mathzone}
  ),
  
  s(
  {trig="([^%a])sum", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\sum")
  },
  {condition = mathzone}
  ),
  
  s(
  {trig="([^%a])prod", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\prod")
  },
  {condition = mathzone}
  ),

}
