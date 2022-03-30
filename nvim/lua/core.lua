require("plugins")
require("theme")
require("loader")
require("nvim-header").setup()
require("formatter").setup({
	logging = false,
	filetype = {
		lua = {
			function()
				return {
					exe = "stylua",
					args = { "--stdin-filepath", vim.fn.expand("%:t"), "-" },
					stdin = true,
				}
			end,
		},
	},
})
