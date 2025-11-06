require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "clangd",
  "intelephense",
  "python-lsp-server",
  "qmlls",
  "remark-language-server",
  "nil",
  "alejandra",
  "rubocop",
  "spectral-language-server",
  "stylua",
  "typescript-language-server",
  "vim-language-server",
  "semgrep",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
