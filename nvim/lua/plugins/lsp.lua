return {
  --- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ansiblels = {},
        astro = {},
        bashls = {},
        cssls = {},
        -- denols = false,
        dockerls = {},
        eslint = {},
        golangci_lint_ls = {},
        gopls = {},
        html = {},
        intelephense = {},
        jsonls = {},
        marksman = {},
        docker_compose_language_service = {},
        tsserver = {},
        vuels = {},
        yamlls = {},
      },
    },
  },

  -- tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "beautysh",
        "chrome-debug-adapter",
        "delve",
        "djlint",
        "eslint_d",
        "firefox-debug-adapter",
        "gofumpt",
        "hadolint",
        "isort",
        "jq",
        "js-debug-adapter",
        "luacheck",
        "markdownlint",
        "php-cs-fixer",
        "php-debug-adapter",
        "phpstan",
        "prettierd",
        "psalm",
        "shellcheck",
        "shfmt",
        "stylua",
      },
    },
  },

  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local nls = require("null-ls")
      nls.setup({
        debounce = 150,
        save_after_format = false,
        sources = {
          nls.builtins.code_actions.gitrebase,
          nls.builtins.code_actions.gitsigns,
          nls.builtins.diagnostics.hadolint,
          nls.builtins.diagnostics.luacheck,
          nls.builtins.diagnostics.markdownlint,
          nls.builtins.diagnostics.phpstan,
          nls.builtins.diagnostics.proselint,
          nls.builtins.diagnostics.shellcheck,
          nls.builtins.formatting.beautysh,
          nls.builtins.formatting.eslint_d,
          nls.builtins.formatting.gofmt,
          nls.builtins.formatting.gofumpt,
          nls.builtins.formatting.isort,
          nls.builtins.formatting.phpcsfixer,
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.stylua,
        },
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
      })
    end,
  },
}
