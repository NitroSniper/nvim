return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
    priority = 900,
    lazy = false,
    keys = {
        { "<leader>cc", "<Cmd>Telescope colorscheme<CR>", desc = {"Changes the colourscheme with Telescope"} },
        { "<leader>pf", "<Cmd>Telescope find_files<CR>", desc = {"Find files in the workspace using Telescope"} },
        { "<leader>pg", "<Cmd>Telescope git_files<CR>", desc = {"TODO!"} },
        { "<leader>ps", "<Cmd>Telescope live_grep<CR>", desc = {"Search for string in workspace with Telescope"} },
        { "<leader>dd", "<Cmd>Telescope diagnostics<CR>", desc = {"Todo!"} },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                        -- even more opts
                    }
                }
            },
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
            }
        })
        require("telescope").load_extension("ui-select")
    end
}
