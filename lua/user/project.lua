local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	return
end

project.setup({
	silent_chdir = false,
	update_cwd = true,
	patterns = { ".bare" },
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})
