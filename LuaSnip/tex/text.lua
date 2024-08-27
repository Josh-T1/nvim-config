local helper = require('luasnip_helpers')
local ls = require("luasnip")
local mathzone = helper.mathzone
local not_mathzone = helper.not_mathzone
local s = ls.snippet_node
local t = ls.text_node
return {
  s(
  {trig="cont", snippetType="snippet"},
  {t("continuous")},
  {condition = not_mathzone}
  ),
}

