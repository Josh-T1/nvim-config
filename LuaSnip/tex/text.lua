local helper = require('luasnip_helpers')
local mathzone = helper.mathzone
local not_mathzone = helper.not_mathzone

return {
  s(
  {trig="neigh", snippetType="autosnippet"},
  {t("neighbourhood")},
  {condition = not_mathzone}
  ),
  
  s(
  {trig="diagl", snippetType="autosnippet"},
  {t("diagonalizable")},
  {condition = not_mathzone}
  ),
  
  s(
  {trig="charpol", snippetType="autosnippet"},
  {t("characteristic polynomial")},
  {condition = not_mathzone}
  ),

  s(
  {trig="linind", snippetType="autosnippet"},
  {t("linearly independent")},
  {condition = not_mathzone}
  ),
  
  s(
  {trig="lindep", snippetType="autosnippet"},
  {t("linearly independent")},
  {condition = not_mathzone}
  ),
  
  s(
  {trig="reprd", snippetType="autosnippet"},
  {t("represented")},
  {condition = not_mathzone}
  ),
  
  s(
  {trig="reprn", snippetType="autosnippet"},
  {t("representation")},
  {condition = not_mathzone}
  ),

  s(
  {trig="iso"},
  {t("isomorphism")},
  {condition = not_mathzone}
  ),
--  
  s(
  {trig="WM", snippetType="autosnippet"},
  {t("Weierstrass M-test")},
  {condition = not_mathzone}
  ),
  
--  s(
--  {trig="diff", snippetType="autosnippet"},
--  {t("differentiable")},
--  {condition = not_mathzone}
--  ),
--  
--  s(
--  {trig="func", snippetType="autosnippet"},
--  {t("function")},
--  {condition = not_mathzone}
--  ),
  s(
  {trig="cont"},
  {t("continuous")},
  {condition = not_mathzone}
  ),


  s(
  {trig="([%s])evec([%s])", snippetType="autosnippet"},
  {
  f( function(_, snip) return snip.captures[1] end ),
  t("eigenvector"),
  f( function(_, snip) return snip.captures[2] end ),
  },
  {condition = not_mathzone}
  ),

  s(
  {trig="([%s])eval([%s])", snippetType="autosnippet", regTrig=true, wordTrig=false},
  {
  f( function(_, snip) return snip.captures[1] end ),
  t("eigenvalue"),
  f( function(_, snip) return snip.captures[1] end ),
  },
  {condition = not_mathzone}
  ),
}

