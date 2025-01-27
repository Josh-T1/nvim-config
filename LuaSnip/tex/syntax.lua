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
--local fmta = ls.require('luasnip.extras').fmta
local mat = helpers.mat
local matrix_type = helpers.matrix_type
local d = ls.dynamic_node
return{

  s(
  { trig="m%*", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    t("\\mu^{*}("), i(1), t(")"),i(0)
    },
  {condition = mathzone}
  ),
  
  s(
  { trig="'", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    t("\\prime")
    },
  {condition = mathzone}
  ),
  s(
  {trig="([^%a])du", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("_{"), i(1), t("}^{"), i(2), t("}"), i(0)
  },
  {condition = mathzone}
	),
  
  s(
  {trig="Hom", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    t("\\text{Hom}_C("), i(1), t(")")
  },
  {condition = mathzone}
	),

  s(
  {trig="rb", snippetType="autosnippet"},
  {t("\\roundbk{"), i(1), t("}"), i(0)},
  {condition = mathzone}
  ), 
  
  s(
  {trig="^", snippetType="autosnippet"},
  {t("\\stackrel{"), i(1), t("}{"), i(2),t("}") , i(0)},
  {condition = mathzone}
  ), 
  
  s(
  {trig="cb", snippetType="autosnippet"},
  {t("\\curlybk{"), i(1), t("}"), i(0)},
  {condition = mathzone}
  ),

	s(
	{trig="sb", snippetType="autosnippet"},
    {t("\\squarebk{"), i(1), t("}"), i(0)},
    {condition = mathzone}
	),
  s(
  { trig="([^%a])lim", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end),
    t("\\mlim{"), i(1), t("\\to"), i(2), t("}"), i(0)
    },
  {condition = mathzone}
  ),


  s(
  {trig="([^%a]?)fn",wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("f_{n}")
  },
    {condition = mathzone}
  ),

  s(
  {trig="uu",wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    t('^{'), i(1), t('}'), i(0)
    },
  {condition = mathzone}
  ),


  s(
  {trig="dd",wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip) return snip.captures[1] end ),
    t("_{"), i(1), t("}"), i(0)
    },
  {condition = mathzone}
    ),
    s(
    {trig = "([%a]*)mat([%d])([%d])", regTrig = true, name = "matrix", dscr = "matrix trigger", snippetType= "autosnippet"},
    fmt([[
    \begin{<>}<>
    <>
    \end{<>}
    ]],
    {
      f(function(arg, snip) return matrix_type(nil) end),
      f(function(_, snip)
        if snip.captures[1] == nil then
          table.remove(snip.captures, 1)
          return ""
        elseif string.match(snip.captures[1], "a") then
          local out = string.rep("c", tonumber(snip.captures[2]) - 1)
          table.remove(snip.captures, 1)
          return "[" .. out .. "|c]"
        else
          return ""

        end -- add funcitonaly 
    end),
      d(1, function(args, snip)
       local dots_match = string.find(snip.captures[1], "d")
       return mat(snip.captures[2], snip.captures[3], dots_match)
      end),

      f(function(arg, snip) return matrix_type(nil) end),
    },
    {delimiters = "<>"}
    ),
    {condition = mathzone}
    ),
	
  s(
	{trig="crossp", snippetType="autosnippet"},
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
  {trig="([%d])case", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  fmt([[
  \begin{cases}
  <>
  \end{cases}
  ]],
  { 
    d(1, function(args, snip)
        local num = tonumber(snip.captures[1])
        local nodes = {}
        local insert_index = 1

        for j = 1, num do
          table.insert(nodes, i(insert_index))
          insert_index = insert_index + 1
          table.insert(nodes, t(" & "))
          table.insert(nodes, i(insert_index))
          insert_index = insert_index + 1
          if j~= num then
            table.insert(nodes, t{"\\\\", ""})
          end
        end
        return sn(nil, nodes)
  end)
  },
    {delimiters = "<>"}
  ),
    {condition = mathzone}
  ),
 
  s(
  {trig="(.?)%?",wordTrig=false, regTrig=true, snippetType="autosnippet", 
  description="limit snippet. Optional prefix flags [i|u|b] "
  },
  fmt([[<>]],
  {
    d(1, function(args, snip)
      local nodes = {}
      local last_char = ""
      if snip.captures[1] ~= nil then
        last_char = snip.captures[1]
      end

      if snip.captures[1] == "i" then
        table.insert(nodes, t("\\limits_{n=1}^{\\infty}"))

      elseif snip.captures[1] == "d" then
        table.insert(nodes, t("\\limits_{"))
        table.insert(nodes, i(1))
        table.insert(nodes, t("}"))

      elseif snip.captures[1] == "u" then
        table.insert(nodes, t("\\limits^{"))
        table.insert(nodes, i(1))
        table.insert(nodes, t("}"))

      else
        table.insert(nodes, t(last_char .. "\\limits_{"))
        table.insert(nodes, i(1))
        table.insert(nodes, t("}^{"))
        table.insert(nodes, i(2))
        table.insert(nodes, t("}"))
      end
    return sn(nil, nodes)

    end)
    },
    {delimiters = "<>"}
  ),
  {condition = mathzone}
  ),
 ------------------------
 --- TODO
 ------------------------
  s(
  {trig="(.?)ii",wordTrig=false, regTrig=true, snippetType="autosnippet", description="limits"},
  fmt([[<>]],
  {
    d(1, function(args, snip)
      local prev_char = snip.captures[1]
      local nodes = {}

      if prev_char == nil then
        table.insert(nodes, t("\\int"))

      elseif prev_char:match("%d") then
        for j=1, tonumber(prev_char) do
          table.insert(nodes, t("\\int"))
          table.insert(nodes, i(j))
        end
      elseif prev_char == "l" then
        table.insert(nodes, t("\\int\\limits_{"))
        table.insert(nodes, i(1))
        table.insert(nodes, t("}^{"))
        table.insert(nodes, i(2))
        table.insert(nodes, t("}"))
      elseif prev_char == "o" then
        table.insert(nodes, t("\\oint"))
      else
        table.insert(nodes, t(prev_char .. "\\int"))
      end
    return sn(nil, nodes)

    end)
    },
    {delimiters = "<>"}
  ),
  {condition = mathzone}
  ),


  s(
  { trig = "ee",wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    t("e^{"), i(1), t("}")
    },
  {condition = mathzone }
  ),


  s(
  {trig="([^%a]?)([%a])%.%.",wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    f( function(_, snip) return snip.captures[2] end ), t("_1, \\dots, "),
    f( function(_, snip) return snip.captures[2] end ), t("_n")
    },
  {condition = mathzone}
  ),

--  s(
--  {trig="([%a])basis",wordTrig=false, regTrig=true, snippetType="autosnippet"},
--  {
--    t("\\curlybk{"),
--    t("\\vec{"), f( function(_, snip) return snip.captures[1] end ), t("}_1,...,"),
--    t("\\vec{"), f( function(_, snip) return snip.captures[1] end ), t("}_"), i(1), t("}")
--    },
--  {condition = mathzone}
--  ),

  s(
  {trig='([^%a]?)(\\)([%a]*)(%{?)([%a]+)(%}?)%.%.',wordTrig=false, regTrig=true, snippetType="autosnippet",
   description="Match commands with or without curly braces and make sequence"},
    fmt([[<>]],{
    d(1, function(_, snip)
      local nodes = {}
      local command = "\\"
      if snip.captures[1] ~= nil then
        table.insert(nodes, t(snip.captures[1]))
      end
      if snip.captures[3] ~= nil then
        command = command .. snip.captures[3]
      end
      if snip.captures[4] ~= nil then
        command = command .. snip.captures[4]
      end
      command = command .. snip.captures[5]
      if snip.captures[6] ~= nil then
        command = command .. snip.captures[6]
      end
      local val = command .. "_1, \\dots, " .. command .. "_n"
      table.insert(nodes, t(val))
      return sn(nil, nodes)
      end)
  },
  {delimiters="<>"}
  ),
  {condition = mathzone}
  ),

  s(
  {trig="span", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
  t("\\operator{Span}\\curlybk{"), i(1), t("}"), i(0)
  },
  {condition = mathzone}
  ),	
  s(
  {trig="([^%a])diag", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
  f( function(_, snip) return snip.captures[1] end ),
  t("\\operatorname{diag}"),t("("), i(1), t(")"), i(0)
  },
  {condition = mathzone}
  ),	

  s(
  {trig="([^%a]?)null", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\operatorname{null}"),
  },
  {condition = mathzone}
  ),	


  s(
  {trig="([^%a]?)nullity", snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\text{nullity}")
  },
  {condition = mathzone}
  ),

  s(
  {trig="([^%a]?)rank", snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\text{rank}")
  },
  {condition = mathzone}
  ),

  s(
  {trig="([^%a]?)inv", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("^{-1}")
    },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a]?)sinv", wordTrig=false, regTrig=true, snippetType="autosnippet"},
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("^\\dagger ")
  },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a]?)bar", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\overline{"), i(1), t("}"), i(0)
    },
    {condition = mathzone}
  ),

  s(
  {trig="([^%a]?)hat", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\hat{"), i(1), t("}"), i(0)
    },
    {condition = mathzone}
  ),
  s(
  {trig="([^%a]?)tilde", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    f( function(_, snip)
      if snip.captures[1] ~= nil then
        return snip.captures[1]
      else
        return ""
      end
    end ),
    t("\\tilde{"), i(1), t("}"), i(0)
    },
    {condition = mathzone}
  ),

  s(
  {trig="([%a])>", wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
  {
    t("\\vec{"),
    f( function(_, snip) return snip.captures[1] end ),
     t("}")
    },
    {condition = mathzone}
  ),
 --- TODO
 s(
 {trig="([%a])seq",wordTrig=false, regTrig=true, snippetType="autosnippet"}, 
 { t("\\curlybk{"),
  f( function(_, snip) return snip.captures[1] end ),
  t("_n}_{n \\in \\mathbb{N}}")},
  {condition = mathzone}
 ),
 
 s(
 {trig="bold",wordTrig=true, snippetType="autosnippet"},
 { t("\\boldsymbol{\\mathit{"), i(1), t("}}")}
 ),

--  s(
--  {trig="([%u])", wordTrig=false, regTrig=true, snippetType="autosnippet",
--  desription="captilize all upper case letters"},
--  {
--    t("\\("),
--    f( function(_, snip) return snip.captures[1] end ), t("\\)")
--    },
--    {condition = function()
--      -- Returns true when: 1. in mathzone, 2. Previous chars do not have the pattern "[%a]%.[%s]"
--        local math_zone = mathzone()
--        if math_zone then
--          return false
--        end
--        local prev_char_1 = helpers.prev_char(1)
--        -- Start of line -> false
--        if prev_char_1 == nil then
--          return false
--        end
--        -- Preceeding letters are used to expand other snippets when char is upper case
--        if not prev_char_1:match("%s") or prev_char_1:match("%.") then
--            return false
--        end
--
--        return true
--
--    end
--    }
--  ),

}
