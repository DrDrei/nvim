local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

configs.setup({
	sync_install = false,
	ignore_install = { "" },
	ensure_installed = {
		"javascript",
		"jsdoc",
		"tsx",
		"typescript",
	},
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
