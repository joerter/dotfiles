return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {},
	config = function()
    require('bufferline').setup({})
		local map = vim.api.nvim_set_keymap
		options = { noremap = true }

		map("n", "<leader>bp", ":BufferLinePick<cr>", options)
	end,
}
