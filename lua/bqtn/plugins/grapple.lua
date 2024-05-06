return {
    "cbochs/grapple.nvim",
    opts = {
        scope = "git", -- also try out "git_branch"
        icons = false, -- setting to "true" requires "nvim-web-devicons"
        status = false,
    },
    keys = {
        { "<leader>a", "<cmd>Grapple toggle<cr>", desc = "Mark File" },
        { "<c-e>", "<cmd>Grapple toggle_tags<cr>", desc = "Mark UI" },

        { "<c-h>", "<cmd>Grapple select index=1<cr>", desc = "Mark 1" },
        { "<c-t>", "<cmd>Grapple select index=2<cr>", desc = "Mark 2" },
        { "<c-n>", "<cmd>Grapple select index=3<cr>", desc = "Mark 3" },
        { "<c-s>", "<cmd>Grapple select index=4<cr>", desc = "Mark 4" },

        --{ "<c-s-n>", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
        --{ "<c-s-p>", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
    },
}
