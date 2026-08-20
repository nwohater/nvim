return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        -- Dart/Flutter's LSP is managed by flutter-tools.nvim instead, not Mason.
        ensure_installed = { "lua_ls", "pyright", "ts_ls", "jsonls", "bashls" },
        -- We call vim.lsp.enable() ourselves below (in nvim-lspconfig's config,
        -- after setting shared capabilities), instead of letting Mason do it.
        automatic_enable = false,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      -- Neovim 0.11+ native LSP config API — replaces the deprecated
      -- require('lspconfig')[server].setup() "framework" (removed in nvim-lspconfig v3.0.0).
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = { "lua_ls", "pyright", "ts_ls", "jsonls", "bashls" }

      vim.lsp.config("*", { capabilities = capabilities })
      vim.lsp.enable(servers)

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
    end,
  },
}
