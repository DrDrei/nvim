local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({})
		end,
	},
})

return packer.startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Extra
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")

	-- Colorschemes
	use("Mofiqul/vscode.nvim")
	use("ellisonleao/gruvbox.nvim")

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Favorites
	use({
		"windwp/nvim-autopairs",
		"akinsho/toggleterm.nvim",
		"akinsho/bufferline.nvim",
		"numToStr/Comment.nvim",
		"lewis6991/gitsigns.nvim",
		"kyazdani42/nvim-web-devicons",
		"kyazdani42/nvim-tree.lua",
		"tpope/vim-fugitive",
		"phaazon/hop.nvim",
		"jose-elias-alvarez/null-ls.nvim",
    -- https://github.com/ThePrimeagen/git-worktree.nvim
		"ThePrimeagen/git-worktree.nvim", 
  })

	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				sections = {
					lualine_c = {},
					lualine_z = { "filesize" },
				},
			})
		end,
	})
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	use({
		"DrDrei/project.nvim",
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
