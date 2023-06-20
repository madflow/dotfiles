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
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectory = { mode = "auto" },
          },
        },
        golangci_lint_ls = {},
        gopls = {},
        html = {},
        intelephense = {},
        jsonls = {},
        marksman = {},
        docker_compose_language_service = {},
        prismals = {},
        rust_analyzer = {},
        -- tailwindcss = {},
        tsserver = {},
        vuels = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
              validate = false,
            },
            redhat = {
              telemetry = {
                enabled = false,
              },
            },
          },
        },
      },
      setup = {
        eslint = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(event)
              if not require("lazyvim.plugins.lsp.format").enabled() then
                -- exit early if autoformat is not enabled
                return
              end

              local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
              if client then
                local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                if #diag > 0 then
                  vim.cmd("EslintFixAll")
                end
              end
            end,
          })
        end,
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
          nls.builtins.diagnostics.sqlfluff.with({
            extra_args = { "--dialect", "postgres" }, -- change to your dialect
          }),
          nls.builtins.formatting.stylua,
        },
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
      })
    end,
  },
}
