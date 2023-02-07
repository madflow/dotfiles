-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "astro",
    "dockerls",
    "tsserver",
    "html",
    "cssls",
    "sumneko_lua",
    "denols",
    "golangci_lint_ls",
    "gopls",
    "intelephense",
    "phpactor",
    "psalm",
    "remark_ls",
    "bashls",
    "yamlls",
    "prismals",
    "eslint",
    "tailwindcss",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "prettier", -- ts/js formatter
    "stylua", -- lua formatter
    "eslint_d", -- ts/js linter
    "phpstan",
    "psalm",
    "proselint",
    "gofumpt",
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})
