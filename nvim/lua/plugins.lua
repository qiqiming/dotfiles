local packer = require("loader")
--local packer = require"packer"
packer.startup(function (use)
    use 'wbthomason/packer.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'tpope/vim-fugitive'
    use 'mhinz/vim-startify'
    use 'flrnprz/plastic.vim'
    use 'morhetz/gruvbox'
    use 'kyazdani42/nvim-web-devicons'
    use 'akinsho/nvim-bufferline.lua'
    use 'kyazdani42/nvim-tree.lua'
    use {'nvim-treesitter/nvim-treesitter', run  = ':TSUpdate'}
    use {'glepnir/galaxyline.nvim' , branch = 'main'}
    use 'github/copilot.vim'
    use '~/nvim-header.lua'
    use 'mhartington/formatter.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
end)






