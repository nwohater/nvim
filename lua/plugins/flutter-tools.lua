return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "dart" } },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        dart = { "dart_format" },
      },
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("flutter-tools").setup({
        lsp = {
          capabilities = require("blink.cmp").get_lsp_capabilities(),
        },
      })

      vim.keymap.set("n", "<leader>flr", "<cmd>FlutterRun<cr>", { desc = "Flutter run" })
      vim.keymap.set("n", "<leader>flh", "<cmd>FlutterReload<cr>", { desc = "Flutter hot reload" })
      vim.keymap.set("n", "<leader>flR", "<cmd>FlutterRestart<cr>", { desc = "Flutter hot restart" })
      vim.keymap.set("n", "<leader>flq", "<cmd>FlutterQuit<cr>", { desc = "Flutter quit" })
      vim.keymap.set("n", "<leader>flo", "<cmd>FlutterOutlineToggle<cr>", { desc = "Flutter outline toggle" })
      vim.keymap.set("n", "<leader>fle", "<cmd>FlutterEmulators<cr>", { desc = "Flutter emulators" })
      vim.keymap.set("n", "<leader>fld", "<cmd>FlutterDevices<cr>", { desc = "Flutter devices" })
      vim.keymap.set("n", "<leader>flL", "<cmd>FlutterLogToggle<cr>", { desc = "Flutter log toggle" })
    end,
  },
}
