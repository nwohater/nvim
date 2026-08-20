return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("flutter-tools").setup({
      lsp = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      },
    })

    vim.keymap.set("n", "<leader>flr", "<cmd>FlutterRun<cr>", { desc = "Flutter run" })
    vim.keymap.set("n", "<leader>flh", "<cmd>FlutterHotReload<cr>", { desc = "Flutter hot reload" })
    vim.keymap.set("n", "<leader>flR", "<cmd>FlutterRestart<cr>", { desc = "Flutter hot restart" })
    vim.keymap.set("n", "<leader>flq", "<cmd>FlutterQuit<cr>", { desc = "Flutter quit" })
    vim.keymap.set("n", "<leader>flo", "<cmd>FlutterOutlineToggle<cr>", { desc = "Flutter outline toggle" })
    -- Note: <leader>ar/aS/al/ag were android-nvim-plugin's keymaps (removed); replaced by the fl* set below.
    vim.keymap.set("n", "<leader>fle", "<cmd>FlutterEmulators<cr>", { desc = "Flutter emulators" })
    vim.keymap.set("n", "<leader>fld", "<cmd>FlutterDevices<cr>", { desc = "Flutter devices" })
    vim.keymap.set("n", "<leader>flL", "<cmd>FlutterLogToggle<cr>", { desc = "Flutter log toggle" })
  end,
}
