local config = function()
  local theme = require("lualine.themes.gruvbox_dark")

  require("lualine").setup {
    options = {
      theme = theme,
      section_separators = { "", "" },
      component_separators = { "", "" },
      globalstatus = true,
    },
    -- sections = {
    --   lualine_a = { "buffers" },
    -- },
  }
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  config = config,
}
