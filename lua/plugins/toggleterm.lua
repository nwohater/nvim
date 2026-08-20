return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<c-\>]],
      direction = "float",
      float_opts = {
        border = "curved",
      },
    })

    vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle floating terminal" })

    -- Numbered terminals: toggleterm has no built-in "next/prev" cycling,
    -- so use distinct instances instead (each keeps its own shell alive).
    vim.keymap.set("n", "<leader>1", "<cmd>1ToggleTerm<cr>", { desc = "Toggle terminal 1" })
    vim.keymap.set("n", "<leader>2", "<cmd>2ToggleTerm<cr>", { desc = "Toggle terminal 2" })
    vim.keymap.set("n", "<leader>3", "<cmd>3ToggleTerm<cr>", { desc = "Toggle terminal 3" })
  end,
}
