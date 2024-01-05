return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function() 
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    -- Create your keybindings here...
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
                    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
                    vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {buffer = 0})
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer = 0})
                    vim.keymap.set("n", "<leader>rs", vim.lsp.buf.rename, {buffer = 0})
                    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer = 0})
                    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer = 0})
                end
            })
            local lspconfig = require("lspconfig")
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = lsp_capabilities,
                    })
                end,
            })
        end
    },
    {
        "williamboman/mason.nvim",
        config = true
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                -- Replace these with whatever servers you want to install
                'rust_analyzer',
            }
        }
    },
    {
        lazy=false,
        "hrsh7th/cmp-nvim-lsp",
        dependencies = { "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip" },
        config = function()
            local cmp = require("cmp")
            local cmp_select = {behavior = cmp.SelectBehavior.Select}
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({select = true}),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }
                }, {
                    { name = "buffer" }
                })
            })
        end
    },
--     {
--         "rshkarin/mason-nvim-lint",
--         dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-lint" },
--         config = function() 
--             require("mason-nvim-lint").setup()
--         end
--     },
--     {
--         "mfussenegger/nvim-lint",
--         config = function()
--             require('lint').linters_by_ft = {}
--             vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--                 callback = function()
--                     require("lint").try_lint()
--                 end,
--             })
--         end
--     }

}
