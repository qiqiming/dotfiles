require("plugins")
require("theme")
require("loader")
--require("nvim-header").setup()
require("config.dap.dap-config")
require("config.lsp.lsp-config")
--require("config.lsp.lsp-installer")
require("config.lsp.cmp")

require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}
