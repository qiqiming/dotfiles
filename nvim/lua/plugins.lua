local packer = require("loader")
--local packer = require"packer"
packer.startup(function(use)
    use("wbthomason/packer.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use({ "neoclide/coc.nvim", branch = "release" })
    use("tpope/vim-fugitive")
    use("mhinz/vim-startify")
    use("flrnprz/plastic.vim")
    -- use("morhetz/gruvbox")
    --use 'kyazdani42/nvim-web-devicons'
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
        run = ":TSUpdate",
        commit = "969f7aee253da4fa8a076c3e171546e76644bb70",
        config = function()
            require("config.treesitter")
        end,
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

    use("alaviss/nim.nvim")

    use("github/copilot.vim")
    use("~/nvim-header.lua")
    use("mhartington/formatter.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")

    -- dap
    use("mfussenegger/nvim-dap")
    use({
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
    })
    use("leoluz/nvim-dap-go")
end)
