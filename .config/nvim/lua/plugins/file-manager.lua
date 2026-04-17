return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	keys = {
		{
			"-",
			function()
				require("oil").open_float()
			end,
			desc = "Open parent directory",
		},
	},
}
