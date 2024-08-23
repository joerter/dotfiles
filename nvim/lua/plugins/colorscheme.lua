-- vim.g.nord_contrast = true
-- vim.g.nord_borders = true
--
-- require('nord').set()
vim.cmd[[colorscheme nord]]

--Soloarized:
-- vim.g.solarized_italic_comments = true
-- vim.g.solarized_italic_keywords = true
-- vim.g.solarized_italic_functions = true
-- vim.g.solarized_italic_variables = false
-- vim.g.solarized_contrast = true
-- vim.g.solarized_borders = false
-- vim.g.solarized_disable_background = false

-- Load the colorscheme
-- require('solarized').set()
-- vim.cmd[[colorscheme solarized]]

require("headlines").setup({
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
})

