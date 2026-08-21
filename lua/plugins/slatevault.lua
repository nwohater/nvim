return {
  dir = "~/Documents/Source/slatevault.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    search_paths = { "~/Documents/Source" },
  },
  cmd = "SlateVault",
  keys = {
    { "<leader>sv", "<cmd>SlateVault<cr>", desc = "Browse slateVault" },
  },
}
