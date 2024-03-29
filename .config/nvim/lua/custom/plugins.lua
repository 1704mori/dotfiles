local plugins = {
  -- {
  --   "mhartington/formatter.nvim",
  --   event = "VeryLazy",
  --   opts = function ()
  --     return require "custom.configs.formatter"
  --   end
  -- },
  {
    "kdheepak/lazygit.nvim",
    lazy = false
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function ()
      require('neoscroll').setup {
        mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb', 'j', 'k'},
            hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
      }
    end
  },
  {
  "neovim/nvim-lspconfig",
   config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
   end,
  },
   {
   "williamboman/mason.nvim",
   opts = {
      ensure_installed = {
        "eslint-lsp",
        "gopls",
        "elixir-ls",
        "svelte-language-server",
        "clangd",
        "goimports",
        "lua-language-server",
        "html-lsp",
        "typescript-language-server",
        "tailwindcss-language-server",
        "vue-language-server",
        "prettierd",
        "stylua"
      },
    },
  },
   {
    "windwp/nvim-ts-autotag",
    ft = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}

return plugins
