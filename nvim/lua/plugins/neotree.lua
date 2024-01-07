local map = vim.api.nvim_set_keymap
options = { noremap = true }

map('n', '<leader>ft', ':Neotree toggle<CR>', options)
map('n', '<leader>ff', ':Neotree reveal<CR>', options)

require("neo-tree").setup({
	close_if_last_window = true,
	source_selector = {
		winbar = true,
		statusline = false,
		sources = {
			{ source = "filesystem" },
			{ source = "buffers" },
		},
	},
	window = {
		mappings = {
			["o"] = "open"
		}
	}
})
