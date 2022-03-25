require("plugins")
require("nvim-lua-tree")
require("bufferline").setup()
require("treesitter")
require("statusline")
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
