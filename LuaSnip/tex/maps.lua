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
  { trig="([^%a]?)max", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  { 
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\max\\{"),
    i(1),
    t("\\}")
    },
  {condition = mathzone}
  ),

  s(
  { trig="([^%a]?)min", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  { 
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\min")
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
  { trig="([^%a])ll", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  { 
    f( function(_, snip) return snip.captures[1] end),
    t("\\inf"),
    },
  {condition = mathzone}
  ),
  
  s(
  { trig="([^%a]?)sup([^%a])", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  { 
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1] 
      else
        return ""
      end
    end ),
    t("\\sup"),
    f( function(_, snip) return snip.captures[2] end ),
    },
  {condition = mathzone}
  ),

  s(
  { trig="([^%a]?)lsup", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1] 
      else
        return ""
      end
    end ),
    t("\\limsup")
    },
  {condition = mathzone}
  ),

  s(
  {trig="([^%a])floor",wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\lfloor"), i(1), t("\\rfloor"), i(0)
    },
    {condition = mathzone}
  ),
  s(
  {trig="([^%a]?)ceil",wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1] 
      else
        return ""
      end
    end ),
    t("\\lceil"), i(1), t("\\rceil"), i(0)
    },
    {condition = mathzone}
  ),
-- TODO add product

  s(
  {trig="([^%a]?)sin",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1] 
      else
        return ""
      end
    end ),
    t("\\sin")
    },
  {condition = mathzone}
  ),

  s(
  {trig="([^%a]?)cos",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1] 
      else
        return ""
      end
    end ),
    t("\\cos")
    },
  {condition = mathzone}
  ),

  s(
  {trig="([^%a]?)tan",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1] 
      else
        return ""
      end
    end ),
    t("\\tan ")
    },
  {condition = mathzone}
  ),

  s(
  {trig="([^%a]?)arcsin",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\arcsin ")
    },
  {condition = mathzone}
  ),


  s(
  {trig="([^%a]?)arctan",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1] 
      else
        return ""
      end
    end ),
    t("\\arctan ")
    },
  {condition = mathzone}
  ),

  s(
  {trig="([^%a]?)csc",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\csc")
    },
  {condition = mathzone}
  ),

  s(
  {trig="([^%a]?)log",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\log")
    },
  {condition = mathzone}
  ),

  s(
  {trig="([^%a]?)ln",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  { 
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\ln")
    },
  {condition = mathzone}
  ),

  s(
  {trig="([^%a]?)sinh",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\sinh ")
    },
  {condition = mathzone}
  ),

  s(
  {trig="([^%a]?)cosh",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\cosh ")
    },
  {condition = mathzone}
  ),

  s(
  {trig="([^%a]?)tanh",wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
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
        return sn(nil, {t(capture), t("\\sqrt{"), i(1), t("}"), i(0)})

      end
    end)
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
	
  s(
	{trig="([^%a]?)abs", regTrig=true, wordTrig=false, snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\abs{"), i(1), t("}"), i(0)
  },
    {condition = mathzone}
	),
  
  s(
	{trig="([^%a]?)norm", regTrig=true, wordTrig=false, snippetType="autosnippet"},
	{
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
     end),
    t("\\norm{"), i(1), t("}"), i(0)
  },
  {condition = mathzone}
	),
  

  s(
  {trig="([^%a])im", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("\\operatorname{Im}"), i(1)
  },
  {condition = mathzone}
  ),	

  s(
  {trig="([^%a])re", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip)
        return snip.captures[1]
    end ),
    t("\\operatorname{Re}"), i(1)
  },
  {condition = mathzone}
  ),	


  s(
  {trig="([^%a]?)ker", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\operatorname{ker}("), i(1), t(")"), i(0)
  },
  {condition = mathzone}
  ),	

  s(
  {trig="([^%a]?)range", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\text{ran }("), i(1), t(")"), i(0)
  },
  {condition = mathzone}
  ),	

  s(
  {trig="([^%a]?)dim", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\dim")
  },
  {condition = mathzone}
  ),	

  s(
  {trig="([^%a]?)det", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\operatorname{det}("), i(1), t(")"), i(0)
  },
  {condition = mathzone}
  ),

  s(
  {trig="([^%a])trace", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip)
        return snip.captures[1]
    end ),
    t("\\operatorname{tr}"), i(1), i(0)
  },
  {condition = mathzone}
  ),
  
  s(
  {trig="PDF", wordTrig=false, regTrig=true, snippetType="autosnippet", 
  description="probability density function"},
  {
    t("f_{"), i(1), t("}"), t("("), 
    f(function(args)
      local input = args[1][1]
      return string.lower(input)
    end, {1}
    ),
    t("; "), i(2), t(")"), i(0)
  },
  {condition = mathzone}
  ),
  
  s(
  {trig="EE", wordTrig=false, regTrig=true, snippetType="autosnippet",
  description="exponential"},
  {
      t("\\operatorname{exp}\\curlybk{"), i(1), t("}")
  },
  {condition = mathzone}
  ),

}
