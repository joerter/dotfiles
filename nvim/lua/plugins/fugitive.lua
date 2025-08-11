return {
	"tpope/vim-fugitive",
  dependencies = {
    "tpope/vim-rhubarb",
  },
	init = function()
		local map = vim.api.nvim_set_keymap
		options = { noremap = true }

		map("n", "<leader>gg", ":G<CR>", options)
	end,
}
