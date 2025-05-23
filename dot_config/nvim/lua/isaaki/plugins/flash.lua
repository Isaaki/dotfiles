-- Ignore case when calling jump()
local function flashJump()
	local gi = vim.go.ignorecase
	local gs = vim.go.smartcase
	vim.go.ignorecase = true
	vim.go.smartcase = false
	require("flash").jump()
	vim.go.ignorecase = gi
	vim.go.smartcase = gs
end

return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		search = {
			mode = "",
		},
		modes = {
			search = {
				enabled = false,
			},
		},
	},
  -- stylua: ignore
  keys = {
    { "<leader>k",     mode = { "n", "x", "o" }, function() flashJump() end,              desc = "Flash" },
    { "<leader>K",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  },
}
