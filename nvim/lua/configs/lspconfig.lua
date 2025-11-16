require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "checkmake",
  "codelldb",
  "intelephense",
  "python-lsp-server",
  "yamlls",
  "nixd",
  "qmlls",
  "remark-language-server",
  "dockerfile-language-server",
  "rubocop",
  "stylua",
  "typescript-language-server",
  "vim-language-server",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
