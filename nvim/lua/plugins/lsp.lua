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
        golangci_lint_ls = {},
        helm_ls = {},
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
    },
  },
}
