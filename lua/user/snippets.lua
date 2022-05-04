local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("all", {}, { key = "all" })
ls.add_snippets("javascript", {
	s("clg", t("console.log('Drei: ', "), i(1), t(");")),
	s(
		"cld",
		fmt(
			[[
  console.log('Drei: ', {});
  ]],
			{ i(1, "") }
		)
	),
}, { key = { "javascript", "javascriptreact" } })

ls.filetype_extend("javascript", { "javascriptreact" })
ls.filetype_extend("javascript", { "html" })
