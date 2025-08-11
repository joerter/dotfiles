return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
    "gbprod/none-ls-php.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.terraform_validate,
        require("none-ls.formatting.jq"),
				--require("none-ls.diagnostics.eslint"),
        require("none-ls-php.diagnostics.php"),
			},
		})

		vim.keymap.set("n", "<leader>fr", vim.lsp.buf.format, {})
	end,
}
