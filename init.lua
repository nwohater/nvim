-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader key (used in plugin keymaps below)
vim.g.mapleader = " "

-- Some sane basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- Indentation: use spaces, not tabs, sized for Dart/most languages (2).
-- Neovim's defaults (tabstop=8, noexpandtab) make every auto-indent jump
-- 8 columns using literal tab characters, which reads as "way too far right".
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- Python follows PEP 8 (4 spaces), override just for that filetype.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

require("lazy").setup("plugins")
