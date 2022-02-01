local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Saving/Sourcing
keymap('n', '<leader>sf', ':w<cr>', term_opts)
keymap('n', '<leader>so', ':so %<cr>', term_opts)
keymap('n', '<leader>q',  ':bd<cr>', term_opts)

-- Recenter when scrolling
keymap('n', '<C-u>', '<C-u>zz', term_opts)
keymap('n', '<C-d>', '<C-d>zz', term_opts)

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Telescope
keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap('n', '<leader>fq', "<cmd>lua require('telescope.builtin').quickfix()<cr>", opts)
keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').git_branches()<cr>", opts)
keymap('n', '<leader>fk', "<cmd>lua require('telescope.builtin').neoclip()<cr>", opts)
keymap("n", "<leader>fk", ':Telescope neoclip<cr><esc>', opts)
keymap("n", "<leader>fw", ':HopWord<cr>', opts)

-- Nvim-tree
keymap('n', '<leader>e', "<cmd>NvimTreeToggle<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)

-- Git stuff
keymap("n", "<leader>gs", ":Git<CR>", opts)
keymap("n", "<leader>gw", ":Gwrite<CR>", opts)
keymap("n", "<leader>go", ":Git commit --no-verify<cr>", opts)
keymap("n", "<leader>gR", ":Git rebase -i<cr>", opts)
keymap("n", "<leader>gl", ":Git pull<cr>", opts)
keymap("n", "<leader>gp", ":Git push --no-verify<cr>", opts)
keymap("n", "<leader>gb", ":Git blame<cr>", opts)
keymap("n", "<leader>gd", ":Git difftool<cr>", opts)
keymap("n", "<leader>gj", ":diffget //2<cr>", opts) -- grab current changes
keymap("n", "<leader>gk", ":diffget //3<cr>", opts) -- grab incoming changes

-- Copy relative path
keymap("n", "<leader>cp", ":let @+ = expand('%')<cr>", opts)

