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
      style = "day"
    },
    -- config = function()
    --   -- load the colorscheme here
    --   vim.cmd([[colorscheme tokyonight-night]])
    -- end,
}
