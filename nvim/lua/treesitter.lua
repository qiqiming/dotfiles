local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

ts_config.setup {
    ensure_installed = {
        "lua",
        --"python",
        "go",
    },
    highlight = {
        enable = true,
        use_languagetree = false, -- use languagetree very slow
    },
}
