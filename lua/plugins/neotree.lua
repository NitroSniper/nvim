return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },

    keys = {
        { "<leader>pv", "<Cmd>Neotree<CR>", desc = {"Changes the colourscheme with Telescope"} },
        { "<leader>pV", "<Cmd>Neotree position=current<CR>", desc = {"Changes the colourscheme with Telescope"} },
    }
}
