-- MATCHA
-- created on https://nvimcolors.com

-- Clear existing highlights and reset syntax
vim.cmd('highlight clear')
vim.cmd('syntax reset')

-- Basic UI elements
vim.cmd('highlight Normal guibg=#273136 guifg=#d1ded3')
vim.cmd('highlight NonText guibg=#273136 guifg=#273136')
vim.cmd('highlight CursorLine guibg=#323e45')
vim.cmd('highlight LineNr guifg=#7c8885')
vim.cmd('highlight CursorLineNr guifg=#d1ded3')
vim.cmd('highlight SignColumn guibg=#273136')
vim.cmd('highlight StatusLine gui=bold guibg=#929b75 guifg=#3a483b')
vim.cmd('highlight StatusLineNC gui=bold guibg=#929b75 guifg=#667258')
vim.cmd('highlight Directory guifg=#a8aea2')
vim.cmd('highlight Visual guibg=#545d41')
vim.cmd('highlight Search guibg=#455253 guifg=#e3ebe5')
vim.cmd('highlight CurSearch guibg=#6a7575 guifg=#e3ebe5')
vim.cmd('highlight IncSearch gui=None guibg=#6a7575 guifg=#e3ebe5')
vim.cmd('highlight MatchParen guibg=#455253 guifg=#e3ebe5')
vim.cmd('highlight Pmenu guibg=#303e44 guifg=#d0ded4')
vim.cmd('highlight PmenuSel guibg=#465153 guifg=#fafafa')
vim.cmd('highlight PmenuSbar guibg=#303e44 guifg=#d0ded4')
vim.cmd('highlight VertSplit guifg=#929b75')
vim.cmd('highlight MoreMsg guifg=#9ea976')
vim.cmd('highlight Question guifg=#9ea976')
vim.cmd('highlight Title guifg=#d0ded4')

-- Syntax highlighting
vim.cmd('highlight Comment guifg=#416763 gui=italic')
vim.cmd('highlight Constant guifg=#caa285')
vim.cmd('highlight Identifier guifg=#d0ded4')
vim.cmd('highlight Statement guifg=#dad0b6')
vim.cmd('highlight PreProc guifg=#dad0b6')
vim.cmd('highlight Type guifg=#76b1a3 gui=None')
vim.cmd('highlight Special guifg=#9ea976')

-- Refined syntax highlighting
vim.cmd('highlight String guifg=#c3ab6f')
vim.cmd('highlight Number guifg=#75afa0')
vim.cmd('highlight Boolean guifg=#76b1a3')
vim.cmd('highlight Function guifg=#a1a97e')
vim.cmd('highlight Keyword guifg=#dad0b6 gui=italic')

-- Html syntax highlighting
vim.cmd('highlight Tag guifg=#adb78f')
vim.cmd('highlight @tag.delimiter guifg=#6f7a53')
vim.cmd('highlight @tag.attribute guifg=#dad0b6')

-- Messages
vim.cmd('highlight ErrorMsg guifg=#b86e6e')
vim.cmd('highlight Error guifg=#b86e6e')
vim.cmd('highlight DiagnosticError guifg=#b86e6e')
vim.cmd('highlight DiagnosticVirtualTextError guibg=#36373c guifg=#b86e6e')
vim.cmd('highlight WarningMsg guifg=#c1a971')
vim.cmd('highlight DiagnosticWarn guifg=#c1a971')
vim.cmd('highlight DiagnosticVirtualTextWarn guibg=#363d3c guifg=#c1a971')
vim.cmd('highlight DiagnosticInfo guifg=#00ccff')
vim.cmd('highlight DiagnosticVirtualTextInfo guibg=#23414a guifg=#00ccff')
vim.cmd('highlight DiagnosticHint guifg=#00ffff')
vim.cmd('highlight DiagnosticVirtualTextHint guibg=#23464a guifg=#00ffff')
vim.cmd('highlight DiagnosticOk guifg=#00ff00')

-- Common plugins
vim.cmd('highlight CopilotSuggestion guifg=#416763') -- Copilot suggestion
vim.cmd('highlight TelescopeSelection guibg=#545d41') -- Telescope selection
