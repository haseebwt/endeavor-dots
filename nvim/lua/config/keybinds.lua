-- set functions for easy bindings
local function map(mode, key, value)
	vim.keymap.set(mode, key, value, { noremap = true, silent = true })
end

vim.g.mapleader = " "
map("n", "<leader>cd", vim.cmd.Ex)

-- misc
map("n", "<leader>t", ":NvimTreeToggle<CR>") --open file explorer

map("n", "<C-d>", "<C-d>zz")                 -- Keep cursor in place while moving up/down page
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")                       -- center screen when looping search results
map("n", "N", "Nzzzv")


-- paste and don't replace clipboard over deleted text
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- Replace all instances
map("n", "<leader>s", ":%s//<Left><Left>")                -- entire file
map({ "n", "v" }, "<leader>ss", ":s/\\%V//g<Left><Left>") -- in-line only

--- Easy close and save
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")

-- Make a file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>")

-- Toggle term
map("n", "<A-t>", "<C-\\><C-n>:ToggleTerm direction=horizontal<CR>")

-- Traversing bufferline
map("n", "<A-1>", '<cmd>lua require("bufferline").go_to(1, true)<cr>')
map("n", "<A-2>", '<cmd>lua require("bufferline").go_to(2, true)<cr>')
map("n", "<A-3>", '<cmd>lua require("bufferline").go_to(3, true)<cr>')
map("n", "<A-4>", '<cmd>lua require("bufferline").go_to(4, true)<cr>')
map("n", "<A-5>", '<cmd>lua require("bufferline").go_to(5, true)<cr>')
map("n", "<A-6>", '<cmd>lua require("bufferline").go_to(6, true)<cr>')
map("n", "<A-7>", '<cmd>lua require("bufferline").go_to(7, true)<cr>')
map("n", "<A-8>", '<cmd>lua require("bufferline").go_to(8, true)<cr>')
map("n", "<A-9>", '<cmd>lua require("bufferline").go_to(9, true)<cr>')
map("n", "<A-0>", '<cmd>lua require("bufferline").go_to(-1, true)<cr>')

-- Telescope
map('n', '<leader>ff', function() require('telescope.builtin').find_files() end)
map('n', '<leader>fr', function() require('telescope.builtin').oldfiles() end)
map('n', '<leader>fg', function() require('telescope.builtin').live_grep() end)
map('n', '<leader>fb', function() require('telescope.builtin').buffers() end)
map('n', '<leader>fh', function() require('telescope.builtin').help_tags() end)

-- Git
map('n', '<leader>gc', "<cmd> Telescope git_commits<cr>")
map('n', '<leader>gs', "<cmd> Telescope git_status<cr>")
map('n', '<leader>gf', "<cmd> Telescope git_files<cr>")
map('n', '<leader>gb', "<cmd> Telescope git_branches<cr>")

-- Debug
map("n", "<leader>dc", function() require("dap").continue() end)                                             --  Continue
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end)                                    -- Breakpoint
map("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end) -- Breakpoint (conditional)
map("n", "<leader>di", function() require("dap").step_into() end)                                            -- Step Into
map("n", "<leader>do", function() require("dap").step_over() end)                                            -- Step Over
map("n", "<leader>dO", function() require("dap").step_out() end)                                             -- Step Out
map("n", "<leader>dr", function() require("dap").run_last() end)                                             -- Run Last
map("n", "<leader>du", function() require("dapui").toggle() end)                                             -- Toggle UI
