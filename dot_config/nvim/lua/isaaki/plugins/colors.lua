-- return {
-- 	"navarasu/onedark.nvim",
-- 	config = function()
-- 		require("onedark").setup({ style = "darker" })
-- 		require("onedark").load()
-- 	end,
-- }

return {
	"folke/tokyonight.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	opts = {
		cache = false,
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
	},
	config = function()
		-- load the colorscheme here
		vim.cmd([[colorscheme tokyonight-night]])

    -- Set background transparent
		vim.cmd([[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight SignColumn guibg=NONE ctermbg=NONE
      highlight VertSplit guibg=NONE ctermbg=NONE
      highlight StatusLine guibg=NONE ctermbg=NONE
      highlight EndOfBuffer guibg=NONE ctermbg=NONE
    ]])
	end,
}
