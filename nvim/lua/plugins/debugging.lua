return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      dap.adapters.firefox = {
        type = "executable",
        command = "firefox-debug-adapter",
      }

      dap.configurations.typescriptreact = {
        {
          name = "Debug with Firefox",
          type = "firefox",
          request = "launch",
          reAttach = true,
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}",
          -- firefoxExecutable = "/usr/bin/firefox",
        },
      }

      dap.adapters.php = {
        type = "executable",
        command = "php-debug-adapter",
      }
      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9000,
        },
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug in Docker",
          port = 9000,
          log = true,
          externalConsole = false,
          pathMappings = {
            ["/srv/share"] = "${workspaceRoot}",
          },
          ignore = {
            "**/vendor/**/*.php",
          },
          runtimeArgs = { "-dxdebug.start_with_request=yes" },
          env = {
            XDEBUG_MODE = "debug,develop",
            XDEBUG_CONFIG = "client_port=${port}",
          },
        },
        {
          type = "php",
          name = "Debug current script",
          request = "launch",
          program = "${file}",
          cwd = "${fileDirname}",
          port = 0,
          runtimeArgs = { "-dxdebug.start_with_request=yes" },
          env = {
            XDEBUG_MODE = "debug,develop",
            XDEBUG_CONFIG = "client_port=${port}",
          },
        },
        {
          type = "php",
          name = "Debug current script with arguments",
          request = "launch",
          program = "${file}",
          cwd = "${fileDirname}",
          port = 0,
          args = function()
            return coroutine.create(function(dap_run_co)
              vim.ui.input({ prompt = "Args >" }, function(choice)
                choice = choice or ""
                local arg = vim.split(choice, " ") -- TODO: use a function that handles quotes and spaces
                coroutine.resume(dap_run_co, arg)
              end)
            end)
          end,
          runtimeArgs = { "-dxdebug.start_with_request=yes" },
          env = {
            XDEBUG_MODE = "debug,develop",
            XDEBUG_CONFIG = "client_port=${port}",
          },
        },
      }
    end,
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup({
        dap_configurations = {
          {
            type = "go",
            name = "Debug Package with arguments",
            request = "launch",
            program = "${fileDirname}",
            args = function()
              return coroutine.create(function(dap_run_co)
                vim.ui.input({ prompt = "Args >" }, function(choice)
                  choice = choice or ""
                  local arg = vim.split(choice, " ") -- TODO: use a function that handles quotes and spaces
                  coroutine.resume(dap_run_co, arg)
                end)
              end)
            end,
          },
        },
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup({})
    end,
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    config = function()
      require("dap-vscode-js").setup({
        -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
        -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
        debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
        -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
        -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
        -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
      })

      for _, language in ipairs({ "typescript", "javascript" }) do
        require("dap").configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests",
            -- trace = true, -- include debugger info
            runtimeExecutable = "node",
            runtimeArgs = {
              "./node_modules/jest/bin/jest.js",
              "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          },
        }
      end
    end,
  },
}
