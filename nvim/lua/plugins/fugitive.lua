return {
	"tpope/vim-fugitive",
	init = function()
		local map = vim.api.nvim_set_keymap
		options = { noremap = true }

		map("n", "<leader>gg", ":G<CR>", options)
	end,
}
