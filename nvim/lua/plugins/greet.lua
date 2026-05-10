return {
        "goolord/alpha-nvim",
        config = function()
                local alpha = require('alpha')
                local dashboard = require('alpha.themes.dashboard')

                local logo = [[


           ／＞-🌱-フ
  　　　　| 　_　 _ l
   　　　／` ミ＿xノ
  　 　 /　　　 　 |
  　　 /　 ヽ　　 ﾉ
  ／￣|　　 |　 |   |
  | (￣ヽ＿_ヽ__) _)
  ＼二つ		
	    ]]

                -- Defining the logo
                dashboard.section.header.val = vim.split(logo, "\n")
                dashboard.section.header.opts = {
                        hl = "Pink",
                        position = "center",
                }

                -- Tasks
                local greet = "hello, kavya 󰉊 it's"
                local date = os.date("%I:%M %p, %b %d")

                dashboard.section.tasks = {
                        type = "text",
                        val = string.format("%s %s", greet, date),
                        opts = {
                                hl = "Yellow",
                                position = "center",
                        },
                }

                -- Buttons
                dashboard.section.buttons = {
                        type = "text",
                        val = {
                                dashboard.button("n", "  new file", ":ene <bar> startinsert <cr>"),
                                dashboard.button("f", "󰍉  find file",
                                        ":lua require('telescope.builtin').find_files({hidden=true}) <cr>"),
                                dashboard.button("g", "󰀬  live grep",
                                        ":lua require('telescope.builtin').live_grep({hidden=true}) <cr>"),
                                dashboard.button("r", "󰋚  recent file",
                                        ":lua require('telescope.builtin').oldfiles({hidden=true}) <cr>"),
                                dashboard.button("t", "  browse cwd", ":NvimTreeOpen<cr>"),
                                dashboard.button("c", "  config", ":e ~/.config/nvim/lua/<cr>"),
                                dashboard.button("m", "  mappings", ":e ~/.config/nvim/lua/config/keybinds.lua<cr>"),
                                dashboard.button("l", "  lsp", ":Mason <cr>"),
                                dashboard.button("p", "  plugins", ":Lazy<cr>"),
                                dashboard.button("q", "󰅙  quit", ":q!<cr>"),
                        },
                }


                -- Iterting over each button of the stack and applying the color and applying color on the shortcut ie "f, e, g, etc.."
                for _, button in ipairs(dashboard.section.buttons.val) do
                        button.opts.hl = "Softpink"
                        button.opts.hl_shortcut = "Magenta"
                        button.opts.position = "center"
                end

                -- Defining a function to generate a string
                local function bloof()
                        local plugins = #vim.tbl_keys(require("lazy").plugins())
                        -- local v = vim.version()
                        -- local datetime = os.date " %d-%m-%Y   %H:%M:%S"
                        local platform = vim.fn.has "win32" == 1 and "" or " Linux"
                        return string.format("󰂖 %d  %s  %s", plugins, "-", platform)
                end

                -- Footer
                dashboard.section.footer.val = bloof()
                dashboard.section.footer.opts = {
                            hl = "Green",
                            position = "center",
                    },

                    -- Defining colors
                    vim.api.nvim_set_hl(0, "Green", { fg = "#86aa8b", bold = false })
                vim.api.nvim_set_hl(0, "Pink", { fg = "#f7cdee", bold = true })
                vim.api.nvim_set_hl(0, "Yellow", { fg = "#f97b45", bold = false })
                vim.api.nvim_set_hl(0, 'Softpink', { fg = '#f2baa2', bold = false })
                vim.api.nvim_set_hl(0, 'Magenta', { fg = '#87057c', bold = true })


                -- Layout
                dashboard.config.layout = {
                        -- Space at the top? 0 indicates no
                        { type = "padding", val = 0 },
                        dashboard.section.header,
                        -- 1 px padding after heading
                        { type = "padding", val = 1 },
                        dashboard.section.tasks,
                        { type = "padding", val = 2 },
                        -- dashboard.section.tasks1,
                        -- { type = "padding", val = 2 },
                        {
                                type = "group",
                                val = {
                                        {
                                                type = "group",
                                                val = dashboard.section.buttons.val,
                                                opts = { spacing = 1 },
                                        },

                                },
                                opts = {
                                        layout = "horizontal",
                                },
                        },
                        { type = "padding", val = 0 },
                        dashboard.section.footer,
                }

                -- loading everything
                alpha.setup(dashboard.config)
        end,
}
