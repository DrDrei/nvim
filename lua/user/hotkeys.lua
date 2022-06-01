local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Saving/Sourcing
keymap("n", "<leader>sf", ":w<cr>", term_opts)
keymap("n", "<leader>so", ":so %<cr>", term_opts)
keymap("n", "<leader>q", ":bd<cr>", term_opts)

-- close all buffers :%bd|e#
keymap("n", "<leader>;", "<C-w><C-w>", term_opts)
keymap("n", "<leader>ss", "<cmd>source ~/.config/nvim/lua/user/snippets.lua<cr>", term_opts)
keymap("n", "<leader>l", ":nohl<cr>", term_opts)
keymap("n", "<leader>Q", ":BufferLineCloseLeft<cr>:BufferLineCloseRight<cr>", term_opts)

-- Recenter when scrolling
keymap("n", "<C-u>", "<C-u>zz", term_opts)
keymap("n", "<C-d>", "<C-d>zz", term_opts)
keymap("n", "<C-f>", "za", term_opts)
keymap("n", "Y", "y$", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
keymap("n", "<leader>fc", ":Telescope git_commits<cr>", opts)
keymap("n", "<leader>fu", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>fq", ":Telescope quickfixhistory<cr>", opts)
keymap("n", "<leader>fj", ":Telescope grep_string<cr>", opts)
keymap("n", "<leader>fp", ":Telescope projects<cr>", opts)
keymap("n", "<leader>fw", ":HopWord<cr>", opts)
keymap("n", "<leader>fy", ':lua require("telescope.builtin").grep_string({search = vim.fn.getreg()})<cr><esc>', opts)
keymap("n", "<leader>ft", ":NvimTreeFindFile<cr>", opts)
keymap("n", "<leader>fo", ":w | !open %<cr>", opts)

-- Nvim-tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Navigation
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)

-- Quickfix/Location Lists
keymap("n", "<C-q>", ":copen<cr>zz", opts)
keymap("n", "<C-p>", ":cp<cr>zz", opts)
keymap("n", "<C-n>", ":cnext<cr>zz", opts)
keymap("n", "<leader>cc", ":cclose<cr>zz", opts)

-- Git
keymap("n", "<leader>gs", ":Git<CR>:resize 16<cr>", opts)
keymap("n", "<leader>gf", ":Git fetch --prune", opts)
keymap("n", "<leader>go", ":Git commit --no-verify<cr>", opts)
keymap("n", "<leader>gr", ":Git rebase -i HEAD~", opts)
keymap("n", "<leader>gl", ":Git pull<cr>", opts)
keymap("n", "<leader>gp", ":Git push --no-verify<cr>", opts)
keymap("n", "<leader>gP", ":Git push -f --no-verify<cr>", opts)
keymap("n", "<leader>gb", ":Git blame<cr>", opts)
keymap("n", "<leader>gu", ":Git upstream<cr>", opts)
keymap("n", "<leader>gd", ":Gvdiffsplit<cr>", opts)

-- Worktrees
keymap("n", "<leader>gw", ':lua require("telescope").extensions.git_worktree.git_worktrees()<cr><esc>', opts)
keymap("n", "<leader>ga", ':lua require("telescope").extensions.git_worktree.create_git_worktree()<cr><esc>', opts)
keymap("n", "<leader>gc", ':lua require("git-worktree").create_worktree("', opts)
