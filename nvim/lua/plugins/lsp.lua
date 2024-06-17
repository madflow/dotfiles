return {
  --- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ansiblels = {},
        astro = {},
        biome = {},
        -- bashls = {},
        cssls = {},
        -- denols = false,
        helm_ls = {},
        html = {},
        intelephense = {
          settings = {
            intelephense = {
              telemetry = {
                enable = true,
              },
            },
          },
        },
        -- docker_compose_language_service = {},
        marksman = {},
        -- phpactor = {
        --   filetypes = { "php" },
        --   settings = {
        --     phpactor = {
        --       language_server_phpstan = {
        --         enabled = false,
        --       },
        --       language_server_psalm = {
        --         enabled = false,
        --       },
        --     },
        --   },
        -- },
        prismals = {},
        svelte = {},
        tailwindcss = {},
        templ = {},
        vuels = {},
      },
    },
  },
}
