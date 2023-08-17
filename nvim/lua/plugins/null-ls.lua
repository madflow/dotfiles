return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.code_actions.gitrebase,
        nls.builtins.code_actions.gitsigns,
        nls.builtins.code_actions.impl,
        nls.builtins.diagnostics.actionlint,
        nls.builtins.diagnostics.luacheck,
        nls.builtins.diagnostics.markdownlint,
        nls.builtins.diagnostics.phpstan,
        nls.builtins.diagnostics.shellcheck,
        nls.builtins.formatting.beautysh,
        nls.builtins.formatting.isort,
        nls.builtins.formatting.phpcsfixer,
        nls.builtins.formatting.prettier,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.stylua,
      })
    end,
  },
}
