return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")

		wk.setup({
			plugins = {
				spelling = {
					enabled = true,
				},
			},
		})

    wk.add({
      { "<leader>g", group = "Git" },
      { "<leader>o", group = "Plugins" },
    })
  end,
}
