return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,                             -- Lua
          null_ls.builtins.formatting.prettierd,                          -- Web
          null_ls.builtins.formatting.clang_format,                       -- C/C#/C++
          null_ls.builtins.formatting.google_java_format,                 -- Java
          null_ls.builtins.formatting.black.with({
            args = { "--line-length", "79", "--fast" }, -- Adjust arguments as per your preference
          }),                                                             -- Python
          null_ls.builtins.diagnostics.mypy,
          null_ls.builtins.diagnostics.ruff,
        },
      })

      vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, { desc = "auto-format" })
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
