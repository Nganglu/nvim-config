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
          "denols",                 -- Deno(js/ts)
          "tsserver",               -- Typescript
          "lua_ls",                 -- Lua
          "jedi_language_server",   -- Python
          "jdtls",                  -- Java
          "emmet_ls",               -- Emmet
          --"rust_analyzer", **Configured by Rustacean**
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
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
      lspconfig.lua_ls.setup({})
      lspconfig.jedi_language_server.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.emmet_ls.setup({})
      lspconfig.pyright.setup({
        settings = {
          python = {
            formatting = {
              provider = "black",
              blackPath = "black",
            }
          }
        }
      })

      vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { desc = "Hover (info)" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set({ "n", "v" }, "<leader>c", vim.lsp.buf.code_action, { desc = "Code Action" })
    end,
  },
}
