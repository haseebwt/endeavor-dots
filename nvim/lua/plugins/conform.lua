return {
        'stevearc/conform.nvim',
        keys = {
                {
                        '<leader>of',
                        function()
                                -- If autoformat is currently disabled for this buffer,
                                -- then enable it, otherwise disable it
                                if vim.b.disable_autoformat then
                                        vim.cmd 'FormatEnable'
                                        vim.notify 'Enabled autoformat for current buffer'
                                else
                                        vim.cmd 'FormatDisable!'
                                        vim.notify 'Disabled autoformat for current buffer'
                                end
                        end,
                        desc = 'Toggle autoformat for current buffer',
                },
        },
        opts = {

                formatters_by_ft = {

                        lua = { "prettier" },
                        -- Conform will run multiple formatters sequentially
                        python = { "prettier", "isort", "black" },
                        -- You can customize some of the format options for the filetype (:help conform.format)
                        rust = { "rustfmt", lsp_format = "fallback" },
                        -- Conform will run the first available formatter
                        javascript = { "prettierd", "prettier", stop_after_first = true },

                        cpp = { "clang-format", top_after_first = true },
                },
                format_on_save = function(bufnr)
                        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                                return
                        end
                        -- Disable autoformat for files in a certain path
                        local bufname = vim.api.nvim_buf_get_name(bufnr)
                        if bufname:match("$HOME/dwl/") then
                                return
                        end
                        -- ...additional logic...
                        return { timeout_ms = 500, lsp_format = "fallback" }
                end
        },
        config = function(_, opts)
                require('conform').setup(opts)

                vim.api.nvim_create_user_command('FormatDisable', function(args)
                        if args.bang then
                                -- :FormatDisable! disables autoformat for this buffer only
                                vim.b.disable_autoformat = true
                        else
                                -- :FormatDisable disables autoformat globally
                                vim.g.disable_autoformat = true
                        end
                end, {
                        desc = 'Disable autoformat-on-save',
                        bang = true, -- allows the ! variant
                })

                vim.api.nvim_create_user_command('FormatEnable', function()
                        vim.b.disable_autoformat = false
                        vim.g.disable_autoformat = false
                end, {
                        desc = 'Re-enable autoformat-on-save',
                })
        end,
        -- config = function()
        --         require("conform").setup({
        --                 format_on_save = function()
        --                 end,
        --         })
        -- end,
}
