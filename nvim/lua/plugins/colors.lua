return {
        { --export theme
                -- 'Biscuit-Theme/nvim',
                -- 'AlphaTechnolog/pywal.nvim',
                -- 'wtfox/jellybeans.nvim',
                -- "folke/tokyonight.nvim",
                -- "sainnhe/everforest",
                "rose-pine/neovim",
                -- "sainnhe/gruvbox-material",
                -- "morhetz/gruvbox",
                -- "savq/melange-nvim",
                -- 'sts10/vim-pink-moon',
                lazy = false,    -- make sure we load this during startup if it is your main colorscheme
                priority = 1000, -- make sure to load this before all the other start plugins
                config = function()
                        -- load the colorscheme here
                        vim.cmd.colorscheme('rose-pine-moon')
                end
        },
        {
                -- fancy line
                "nvim-lualine/lualine.nvim",
                dependencies = {
                        "nvim-tree/nvim-web-devicons"
                },
                opts = {
                        theme = 'rose-pine-moon',
                        -- theme = 'pywal-nvim',
                }
        },
}
