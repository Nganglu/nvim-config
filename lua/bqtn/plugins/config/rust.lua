local on_attach = require("plugins.lsp-config").on_attach
local capabilities = require("plugins.lsp-config").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "rust" },
	root_dir = util.root_pattern("Cargo.toml"),
	settings = {
		cargo = {
			allFeatures = true,
		},
	},
})
