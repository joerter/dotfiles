return {
	"lukas-reineke/headlines.nvim",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = true, -- or `opts = {}`
	opts = {
		markdown = {
			headline_highlights = {
				"Headline1",
				"Headline2",
				"Headline3",
				"Headline4",
				"Headline5",
				"Headline6",
			},
			codeblock_highlight = "CodeBlock",
			dash_highlight = "Dash",
			quote_highlight = "Quote",
		},
	},
}
