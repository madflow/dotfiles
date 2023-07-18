return {
  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local nls = require("null-ls")
      nls.setup({
        save_after_format = false,
        sources = {
          nls.builtins.code_actions.gitrebase,
          nls.builtins.code_actions.gitsigns,
          nls.builtins.code_actions.impl,
          nls.builtins.diagnostics.hadolint,
          nls.builtins.diagnostics.luacheck,
          nls.builtins.diagnostics.markdownlint,
          nls.builtins.diagnostics.phpstan,
          nls.builtins.diagnostics.shellcheck,
          nls.builtins.formatting.beautysh,
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
