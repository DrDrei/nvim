local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

toggleterm.setup({
	open_mapping = [[<c-\>]],
	direction = "float",
	hide_numbers = false,
	float_opts = {
		border = "double",
	},
})

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
