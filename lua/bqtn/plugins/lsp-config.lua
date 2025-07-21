-- ~/.config/nvim/lua/bqtn/plugins/lsp-config.lua
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "denols",
          "jedi_language_server",
          "jdtls",
          "emmet_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")

      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        map("n", "<leader>h", vim.lsp.buf.hover, "Hover")
        map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
        map({ "n", "v" }, "<leader>c", vim.lsp.buf.code_action, "Code Action")
      end

      lspconfig.lua_ls.setup({ on_attach = on_attach })
      lspconfig.tsserver.setup({
        on_attach = on_attach,
        root_dir = util.root_pattern("package.json"),
        single_file_support = false,
      })
      lspconfig.denols.setup({
        on_attach = on_attach,
        root_dir = util.root_pattern("deno.json", "deno.jsonc"),
      })
      lspconfig.jedi_language_server.setup({ on_attach = on_attach })
      lspconfig.jdtls.setup({ on_attach = on_attach })
      lspconfig.emmet_ls.setup({ on_attach = on_attach })
    end,
  },
}

