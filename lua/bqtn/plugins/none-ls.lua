return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.google_java_format,
        },
      })

      vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, {desc="auto-format"})
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("null-ls") -- require your null-ls config here (example below)
    end,
  },
}
