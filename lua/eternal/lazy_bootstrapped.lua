require("lazy").setup({
    "folke/which-key.nvim",
    {
    "notken12/base46-colors",
    {
        "nvim-treesitter/nvim-treesitter", build=":TSUpdate"
    },
    "nvim-treesitter/playground",

    -- LSP dependencies
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
        "hrsh7th/cmp-nvim-lsp", dependencies = { "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip" }
    }, -- code completion
    "mfussenegger/nvim-lint",
})
