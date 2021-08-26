local fn = vim.fn
local cmd = vim.api.nvim_command

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    print("packer cloning")
    cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    cmd("packadd packer.nvim")
end

local ok, packer = pcall(require, "packer")

if not ok then
    error("load packer error")
    return
end

return packer
