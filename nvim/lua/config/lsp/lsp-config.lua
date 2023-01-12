-- local M = {}
--
--
-- M.setup = function()
--     local signs = {
--         { name = "DiagnosticSignError", text = "" },
--         { name = "DiagnosticSignWarn", text = "" },
--         { name = "DiagnosticSignHint", text = "" },
--         { name = "DiagnosticSignInfo", text = "" },
--     }
--
--     for _, sign in ipairs(signs) do
--         vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
--     end
--
--     local config = {
--         -- disable virtual text
--         virtual_text = false,
--         -- show signs
--         signs = {
--             active = signs,
--         },
--         update_in_insert = false,
--         underline = true,
--         severity_sort = true,
--         float = {
--             focusable = false,
--             style = "minimal",
--             border = "single",
--             source = "always",
--             header = "",
--             prefix = "",
--         },
--     }
--
--     vim.diagnostic.config(config)
--
--     vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--         border = "rounded",
--     }) vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
--         border = "rounded",
--     })
-- end
--
-- local function lsp_keymaps(bufnr)
--     local bufopts = { noremap=true, silent=true, buffer=bufnr }
--     local opts = { noremap=true, silent=true,  }
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--     vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
--
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--     vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--     vim.keymap.set('n', '[g', vim.lsp.diagnostic.goto_prev, bufopts)
--     vim.keymap.set('n', ']g', vim.lsp.diagnostic.goto_next, bufopts)
--     vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--     -- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
--
--     --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--     --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--     --vim.keymap.set('n', '<space>wl', function()
--     --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     --end, bufopts)
-- end
--
-- M.on_attach = function(client, bufnr)
--     lsp_keymaps(bufnr)
-- end
--
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
--
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end
--
-- function go_org_imports(wait_ms)
--     local params = vim.lsp.util.make_range_params()
--     params.context = {only = {"source.organizeImports"}}
--     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
--     for cid, res in pairs(result or {}) do
--         for _, r in pairs(res.result or {}) do
--             if r.edit then
--                 local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
--                 vim.lsp.util.apply_workspace_edit(r.edit, enc)
--             end
--         end
--     end
-- end
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.go" },
--   callback = function()
-- 	  vim.lsp.buf.formatting_sync(nil, 3000)
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = { "*.go" },
-- 	callback = function()
-- 		local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
-- 		params.context = {only = {"source.organizeImports"}}
--
-- 		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
-- 		for _, res in pairs(result or {}) do
-- 			for _, r in pairs(res.result or {}) do
-- 				if r.edit then
-- 					vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
-- 				else
-- 					vim.lsp.buf.execute_command(r.command)
-- 				end
-- 			end
-- 		end
-- 	end,
-- })
--
--
-- M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
-- return M

local on_attach = function(_, bufnr)
	-- NOTE: Remember that lua is a real programming language, and as such it is possible
	-- to define small helper and utility functions so you don't have to repeat yourself
	-- many times.
	--
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("gD", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	--nmap("[g", vim.lsp.diagnostic.goto_prev)
	--namp("]g", vim.lsp.diagnostic.goto_next)
	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	--nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	--nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	--nmap('<leader>wl', function()
	--  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	--end, '[W]orkspace [L]ist Folders')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

local servers = {
	-- clangd = {},
	-- gopls = {},
	-- pyright = {},
	-- rust_analyzer = {},
	-- tsserver = {},

	--sumneko_lua = {
	--	Lua = {
	--		workspace = { checkThirdParty = false },
	--		telemetry = { enable = false },
	--	},
	--},
}

-- Setup neovim lua configuration
require("neodev").setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})

-- Turn on lsp status information
require("fidget").setup()
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)

