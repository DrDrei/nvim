local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

luasnip.config.set_config({
	history = true,
	updateevents = "textchanged,textchangedi",
})
