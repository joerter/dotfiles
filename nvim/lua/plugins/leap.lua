-- Use the traversal keys to repeat the previous motion without explicitly
-- invoking Leap.
return {
	"ggandor/leap.nvim",
	dependencies = "tpope/vim-repeat",
	opts = {
		-- Define equivalence classes for brackets and quotes, in addition to
		-- the default whitespace group.
		equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" },
		special_keys = {
			prev_target = "<backspace>",
			prev_group = "<backspace>",
		},
		config = function()
			require("leap.user").set_repeat_keys("<enter>", "<backspace>")
			--require('leap').create_default_mappings()
			vim.keymap.set("n", "s", "<Plug>(leap)")
			vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
			vim.keymap.set({ "x", "o" }, "s", "<Plug>(leap-forward)")
			vim.keymap.set({ "x", "o" }, "S", "<Plug>(leap-backward)")
		end,
	},
}
