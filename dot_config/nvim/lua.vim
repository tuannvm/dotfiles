lua << EOF
require('plugins')

-- copilot
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
          expr = true,
          replace_keycodes = false
        })

-- completion
vim.o.completeopt = "menuone,noselect"

vim.g.coq_settings = { auto_start = true }
require("coq")

-- floating window

local on_attach = function(client, bufnr)
  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover)
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help)
end


-- file explorer

require'nvim-tree'.setup {
}

-- tabbar
--require("bufferline").setup{
--  options = {
--    offsets = {
--      {
--        filetype = "NvimTree",
--        text = "File Explorer",
--        highlight = "Directory",
--        text_align = "left"
--      }
--    }
--  }
--}

-- diagnosis

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]

-- lspconfig
require'lspconfig'.gopls.setup{ on_attach = on_attach }
require'lspconfig'.pyright.setup{ on_attach = on_attach }
require'lspconfig'.terraformls.setup{ on_attach = on_attach }

-- highlight
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go", "gomod", "gdscript", "yaml", "hcl", "python" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true
  }
}

-- status bar --
-- For reference https://gist.github.com/hoob3rt/b200435a765ca18f09f83580a606b878
-- Color table for highlights
local colors = {
  bg = '#202328',
  fg = '#bbc2cf',
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}

-- fix intro
local num_args = vim.api.nvim_eval(vim.api.nvim_exec('echo argc()', true))
if num_args == 0 then
    vim.api.nvim_exec('intro', false)
end
--

-- tmux
require('Navigator').setup({
    disable_on_zoom = true
})

-- Keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', "<C-w><Left>", "<CMD>lua require('Navigator').left()<CR>", opts)
map('n', "<C-w><Up>", "<CMD>lua require('Navigator').up()<CR>", opts)
map('n', "<C-w><Right>", "<CMD>lua require('Navigator').right()<CR>", opts)
map('n', "<C-w><Down>", "<CMD>lua require('Navigator').down()<CR>", opts)

-- commit gpt
vim.api.nvim_create_user_command('Msg', function()
    vim.cmd('!lumen draft | pbcopy')
end, {})
EOF

