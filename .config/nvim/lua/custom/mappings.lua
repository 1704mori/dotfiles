local M = {}

local config = require "core.default_config"

M._gitsigns = {
  n = {
    ["<leader>gg"] = {"<cmd> LazyGit <CR>", "LazyGit"}
  }
}

config.mappings.gitsigns = vim.tbl_deep_extend("force", config.mappings.gitsigns, M._gitsigns)

return M