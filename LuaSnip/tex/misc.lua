local helpers = require("helperfn")
local math_zone = helpers.in_mathzone

return{
	s(
	{trig="mskip", snippetType="autosnippet"},
	{t("\\bigbreak  \\noindent")},
	{condition = math_zone}
	),


	s(
	{trig="lrlr", snippetType="autosnippet"},
	{t("\\left"), i(1),t(" "), i(2), t(" \\right")}
	),

}
