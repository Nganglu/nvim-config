return {
	"goolord/alpha-nvim",
	config = function()
		require("alpha").setup(require("alpha.themes.dashboard").config)
		local status_ok, alpha = pcall(require, "alpha")
		if not status_ok then
			return
		end

		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
"    ______  ___________  ___      ___  __     ___      ___ ",
"   /      \\(      _    )|   \\    /   ||  \\   |   \\    /   |",
"  // ____  \\)__/  \\\\__/  \\   \\  //  / ||  |   \\   \\  //   |",
" /  /    )  )  \\\\_  /     \\\\  \\/. ./  |:  |   /\\\\  \\/.    |",
"(: (____/ //   |.  |       \\.    //   |.  |  |: \\.        |",
" \\         \\   \\:  |        \\\\   /    /\\  |\\ |.  \\    /:  |",
"  \\_____/\\__\\   \\__|         \\__/    (__\\_|_)|___|\\__/|___|",
}

		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("c", "  Configuration", ":e ~/.config/nvim/lua/bqtn/options.lua<CR>"),
			dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
		}

		local function footer()
			return "Welcome to QTVim"
		end

		dashboard.section.footer.val = footer()

		dashboard.section.footer.opts.hl = "Type"
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
