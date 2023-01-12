local packer = require("loader")

packer.startup(function(use)
	-- lsp
	use({
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",
			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	})

	-- cmp
	use({
		"hrsh7th/nvim-cmp",
		requires = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	})

	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completion
	use("hrsh7th/cmp-nvim-lua")

	use("wbthomason/packer.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use({
		"lewis6991/gitsigns.nvim",
		tag = "release"
	})

	use("flrnprz/plastic.vim")
	use("nvim-lua/popup.nvim")

	--use({
	--	"startup-nvim/startup.nvim",
	--	requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	--	config = function()
	--		require("startup").setup()
	--	end,
	--})

	use({
		"akinsho/nvim-bufferline.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("bufferline").setup()
		end,
	})

	-- nvim tree
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("config.nvim-lua-tree")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		config = function()
			require("config.treesitter")
		end,
	})

	use({ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})

	-- statusline
	use({
		"glepnir/galaxyline.nvim",
		branch = "main",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("config.statusline")
		end,
	})

	use({
		"ellisonleao/gruvbox.nvim",
		requires = { "rktjmp/lush.nvim" },
	})

	use({
		"~/nvim-header.lua",
		config = function()
			require("nvim-header").setup()
		end,
	})

	use({
		"mhartington/formatter.nvim",
		config = function()
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
		end,
	})
	use("tpope/vim-sleuth")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")

	-- dap
	use("mfussenegger/nvim-dap")
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("config.dap.dap-ui")
		end,
	})

	use({
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	})

	use({
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
		end,
	})
end)
