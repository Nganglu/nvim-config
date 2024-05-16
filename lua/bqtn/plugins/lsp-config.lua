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
          "denols",
          "tsserver",
          --"rust_analyzer", **Configured by Rustacean**
          "jedi_language_server", --Python
          "jdtls",           --Java
          "emmet_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      local nvim_lsp = require("lspconfig")
      nvim_lsp.denols.setup({
        on_attach = on_attach,
        root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
      })

      nvim_lsp.tsserver.setup({
        on_attach = on_attach,
        root_dir = nvim_lsp.util.root_pattern("package.json"),
        single_file_support = false,
      })
      --lspconfig.rust_analyzer.setup({})
      lspconfig.jedi_language_server.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.emmet_ls.setup({})

      vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { desc = "Hover (info)" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set({ "n", "v" }, "<leader>c", vim.lsp.buf.code_action, { desc = "Code Action" })
    end,
  },
}
