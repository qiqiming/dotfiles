local nvim_tree = require("nvim-tree")
local tree_cb = require("nvim-tree.config").nvim_tree_callback
local g = vim.g

g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_root_folder_modifier = ":~" -- This is the default. See :help filename-modifiers for more options
g.nvim_tree_width_allow_resize = 1 -- 0 by default, will not resize the tree when opening a file
-- g.nvim_tree_disable_window_picker = 0 -- 0 by default, will disable the window picker.
--  Dictionary of buffer option names mapped to a list of option values that
--  indicates to the window picker that the buffer's window should not be
--  selectable.
g.nvim_tree_special_files = { "README.md", "Makefile", "MAKEFILE" } --  List of filenames that gets highlighted with NvimTreeSpecialFile
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 0,
}
-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath.
-- if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
-- but this will not work when you set indent_markers (because of UI conflict)

--  default will show icon by default if no icon is provided
--  default shows no icon by default
g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌",
    },
    folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
    },
    lsp = {
        hint = "",
        info = "",
        warning = "",
        error = "",
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false
            }
        }
    }
}

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
    auto_close = false,
    open_on_tab = false,
    update_cwd = false,
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    update_to_buf_dir = {
        enable = false,
        auto_open = true,
    },

    view = {
        side = "left",
        width = 30,
        auto_resize = true,
        mappings = {
            custom_only = true,
            list = list,
        },
    },
    filters = {
        dotfiles = false,
        custom = { ".git", "node_modules", ".cache", "output" },
    },
    git = {
        ignore = true,
    },
})
