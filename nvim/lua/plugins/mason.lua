return {
        {
                "mason-org/mason-lspconfig.nvim",
                opts = {},
                dependencies = {
                        {
                                "mason-org/mason.nvim",
                                opts = {
                                        ensure_installed = {
                                                "lua_ls",
                                                "pyright",
                                        },

                                        handlers = {
                                                -- this first function is the "default handler"
                                                -- it applies to every language server without a custom handler
                                                function(server_name)
                                                        require('lspconfig')[server_name].setup({})
                                                end,
                                        },
                                }
                        }
                },
        }
}
