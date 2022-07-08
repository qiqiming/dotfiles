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
    open_on_setup_file = false,
    sort_by = "name",

    view = {
        side = "left",
        width = 30,
        hide_root_folder = false,
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = true,
            list = list,
        },
    },
    diagnostics = {
        enable = false,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    renderer = {
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            glyphs = {
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },

            },
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },

    filters = {
        dotfiles = false,
        custom = { ".git", "node_modules", "output" },
    },

    git = {
        enable = true,
        ignore = true,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
})
