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
		map("n", "<leader>bco", ":BufferLineCloseOthers<cr>", options)
		map("n", "<leader>bcl", ":BufferLineCloseLeft<cr>", options)
		map("n", "<leader>bcr", ":BufferLineCloseRight<cr>", options)
		map("n", "<leader>bo", ":BufferLineSortByDirectory<cr>", options)

	end,
}
