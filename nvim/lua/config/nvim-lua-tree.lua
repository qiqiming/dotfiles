local nvim_tree = require("nvim-tree")
local tree_cb = require("nvim-tree.config").nvim_tree_callback
local g = vim.g

vim.api.nvim_set_keymap("", "_", ":NvimTreeToggle<CR>", {
    noremap = true,
    silent = true,
})

local list = {
    --   ["u"] = ":lua require'some_module'.some_function()<cr>",
    -- default mappings
    { key = { "<CR>" }, cb = tree_cb("edit") },
    { key = { "o" }, cb = tree_cb("edit") },
    { key = { "l" }, cb = tree_cb("edit") },
    { key = { "<2-LeftMouse>" }, cb = tree_cb("edit") },
    { key = { "<2-RightMouse>" }, cb = tree_cb("cd") },
    { key = { "<C-]>" }, cb = tree_cb("cd") },
    { key = { "<C-v>" }, cb = tree_cb("vsplit") },
    { key = { "<C-x>" }, cb = tree_cb("split") },
    { key = { "<C-t>" }, cb = tree_cb("tabnew") },
    { key = { "<" }, cb = tree_cb("prev_sibling") },
    { key = { ">" }, cb = tree_cb("next_sibling") },
    { key = { "<BS>" }, cb = tree_cb("close_node") },
    { key = { "<S-CR>" }, cb = tree_cb("close_node") },
    { key = { "K" }, cb = tree_cb("preview") },
    { key = { "I" }, cb = tree_cb("toggle_ignored") },
    { key = { "H" }, cb = tree_cb("toggle_dotfiles") },
    { key = { "R" }, cb = tree_cb("refresh") },
    { key = { "a" }, cb = tree_cb("create") },
    { key = { "d" }, cb = tree_cb("remove") },
    { key = { "r" }, cb = tree_cb("rename") },
    { key = { "<C-r>" }, cb = tree_cb("full_rename") },
    { key = { "x" }, cb = tree_cb("cut") },
    { key = { "c" }, cb = tree_cb("copy") },
    { key = { "p" }, cb = tree_cb("paste") },
    { key = { "y" }, cb = tree_cb("copy_name") },
    { key = { "Y" }, cb = tree_cb("copy_path") },
    { key = { "gy" }, cb = tree_cb("copy_absolute_path") },
    { key = { "[c" }, cb = tree_cb("prev_git_item") },
    { key = { "]c" }, cb = tree_cb("next_git_item") },
    { key = { "-" }, cb = tree_cb("dir_up") },
    { key = { "q" }, cb = tree_cb("close") },
}

nvim_tree.setup({
    open_on_setup = false,
    open_on_tab = false,
    update_cwd = true,
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,

    view = {
        side = "left",
        width = 30,
        mappings = {
            custom_only = true,
            list = list,
        },
    },

    filters = {
        dotfiles = false,
        custom = { ".git", "node_modules", "output" },
    },

    git = {
        ignore = true,
    },
})
