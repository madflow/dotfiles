return {
  --- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ansiblels = {},
        astro = {},
        -- bashls = {},
        cssls = {},
        -- denols = false,
        helm_ls = {},
        html = {},
        intelephense = {},
        -- docker_compose_language_service = {},
        marksman = {},
        prismals = {},
        svelte = {},
        tailwindcss = {},
        templ = {},
        vuels = {},
      },
    },
  },
}
