return{

	s(
	{trig="r'a", snippetType="autosnippet"}, 
	{t("\\Rightarrow ")}
	),


	s(
	{trig="b'a", snippetType="autosnippet"}, 
	{t("\\Leftrightarrow ")}
	),

    s(
	{trig="..c", snippetType="autosnippet"},
	fmta(
	[[
		<>_{<>}, <>_{<>}, \ldots,<>_{<>}
	]],
	{
		i(1),
		i(2),
		rep(1),
		i(3),
		rep(1),
		i(3),
	}
	)
	),



}
