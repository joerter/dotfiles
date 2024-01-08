require("tokyonight").setup({
	-- use the night style
	style = "storm",
	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	on_highlights = function(hl, c)
		hl.LineNr = {
			fg = "#9ece6a"
		}
		hl.CursorLineNr = {
			fg = "#73daca"
		}
	end
})

vim.cmd[[colorscheme tokyonight]]

