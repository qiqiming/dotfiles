local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

ts_config.setup {
    ensure_installed = {
        "lua",
        "python",
        "bash",
        "typescript",
        "go",
    },

    highlight = {
        enable = true,
        use_languagetree = true, -- use languagetree very slow
    },

    incremental_selection = {
    enable = true,
    keymaps = {
        init_selection = '<CR>',
        node_incremental = '<CR>',
        node_decremental = '<BS>',
        scope_incremental = '<TAB>',
    }
  },
}


vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldlevel = 99
