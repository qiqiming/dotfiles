local packer = require("loader")

packer.startup(function(use)
    -- lsp
    use("neovim/nvim-lspconfig")
    use "williamboman/nvim-lsp-installer"
    -- cmp
    use { "hrsh7th/nvim-cmp" }
    use("hrsh7th/cmp-nvim-lsp")
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completion
    use "hrsh7th/cmp-nvim-lua"
    use "saadparwaiz1/cmp_luasnip"

    use "L3MON4D3/LuaSnip" --snippet engine

    use("wbthomason/packer.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("tpope/vim-fugitive")
    use("mhinz/vim-startify")
    use("flrnprz/plastic.vim")
    use("nvim-lua/popup.nvim")
    -- use("morhetz/gruvbox")
    --use 'kyazdani42/nvim-web-devicons'
    --use({ "neoclide/coc.nvim", branch = "release" })

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

    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")

    -- dap
    use("mfussenegger/nvim-dap")
    use({
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
        config = function()
            require("config.dap-ui")
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
