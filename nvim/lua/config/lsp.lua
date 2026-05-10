vim.lsp.enable({
        "lua_ls",
        "clangd",
        "pylsp",
        "rust_analyzer",
        "html",
        "bash_language_server"
})

local vim = vim

-- Add borders to floating windows
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = 'rounded' }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = 'rounded' }
)

vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = {
                style = 'minimal',
                border = 'rounded',
                header = '',
                prefix = '',
        },
        signs = {
                text = {
                        [vim.diagnostic.severity.ERROR] = '✘',
                        [vim.diagnostic.severity.WARN] = '▲',
                        [vim.diagnostic.severity.HINT] = '⚑',
                        [vim.diagnostic.severity.INFO] = '»',
                },
        },
        globals = {
                'vim',
        },
})

-- Window border
vim.opt.winborder = "rounded"

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
                vim.keymap.set({ 'n', 'v' }, '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        end,
})

--  vim.api.nvim_create_autocmd('LspAttach', {
--          callback = function(ev)
--      	    local client = vim.lsp.get_client_by_id(ev.data.client_id)
--      	    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
--      		    vim.opt.completeopt = { 'menu', 'noselect', 'menuone', 'noinsert', 'fuzzy', 'popup' }
--      		    local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
--      		    client.server_capabilities.completionProvider.triggerCharacters = chars
--      		    vim.lsp.completion.enable(true, client.id, ev.buf, {
--      			    autotrigger = true,
--      			    convert = function(item)
--      				    return { abbr = item.label:gsub('%b()', '') }
--      			    end,
--      		    })
--      		    vim.keymap.set('i', '<Tab>', function()
--      			    vim.lsp.completion.get()
--      		    end)
--      	    end
--          end,
--  })
