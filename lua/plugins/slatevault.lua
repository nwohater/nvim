-- Uses a local dev checkout if one exists (this machine, or any future
-- machine you're actively hacking on the plugin from); otherwise falls
-- back to the plain GitHub install so a fresh machine works with zero
-- extra steps beyond `nvim` + a synced lazy.nvim.
local dev_path = vim.fn.expand("~/Documents/Source/slatevault.nvim")
local use_local_dev = vim.fn.isdirectory(dev_path) == 1

local spec = {
  main = "slatevault", -- module name doesn't match the repo's mixed-case name
  cmd = "SlateVault",
  keys = {
    { "<leader>sv", "<cmd>SlateVault<cr>", desc = "SlateVault: browse vault docs" },
  },
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    -- Scans immediate subdirectories of each path for a vault.toml marker.
    -- svMac (the actual vault) lives directly under ~/Documents, not ~/Documents/Source.
    search_paths = { "~/Documents", "~/Documents/Source" },
  },
}

if use_local_dev then
  spec.dir = dev_path
else
  spec[1] = "nwohater/slateVault.nvim"
end

return spec
