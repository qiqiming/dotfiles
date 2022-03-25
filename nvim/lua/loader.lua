local fn = vim.fn
local cmd = vim.api.nvim_command

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
print(install_path)
if fn.empty(fn.glob(install_path)) > 0 then
    vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    cmd("packadd packer.nvim")
    local ok, packer = pcall(require, "packer")
    if ok then
        print("Packer cloned successfully.")
    else
        print("Packer cloned Fail.")
    end
end

local ok, packer = pcall(require, "packer")

if not ok then
    error("load packer error")
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
        git = {
            clone_timeout = 5000,
        },
        auto_clean = true,
        compile_on_sync = true,
    }
}

return packer
