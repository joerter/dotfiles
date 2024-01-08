local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ 'echasnovski/mini.nvim', version = '*' },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 
			'nvim-lua/plenary.nvim', 
			'nvim-telescope/telescope-fzf-native.nvim' }
		},
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			}
		},
		{
			'nvim-pack/nvim-spectre',
			dependencies = {
				'nvim-lua/plenary.nvim',
			}
		},
		{
			'tpope/vim-fugitive'
		},
		{
			'nvim-treesitter/nvim-treesitter'
		},
		{
			'stevearc/dressing.nvim',
			opts = {},
		},
		{
			"williamboman/mason.nvim",
			dependencies = {
				'williamboman/mason-lspconfig.nvim',
				'neovim/nvim-lspconfig',
				'hrsh7th/cmp-nvim-lsp',
				"hrsh7th/nvim-cmp",
			}
		},
	})
