return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          --"rust_analyzer", **Configured by Rustacean**
          "jedi_language_server",   --Python
          "jdtls",                  --Java
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      --lspconfig.rust_analyzer.setup({})
      lspconfig.jedi_language_server.setup({})
      lspconfig.jdtls.setup({})

      vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {desc="Hover (info)"})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {desc="Go to Definition"})
      vim.keymap.set({ "n", "v" }, "<leader>c", vim.lsp.buf.code_action, {desc="Code Action"})
    end,
  },
}
