
-- keyboard shortcuts
require("a.maps")

require("a.settings")

-- load plugins
require("a.lazy")

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)



vim.cmd("colorscheme cyberdream")

-- Attach to buffer
require("colorizer").attach_to_buffer(0, { mode = "background", css = true})



