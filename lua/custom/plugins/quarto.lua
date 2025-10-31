return {
  {
    'quarto-dev/quarto-nvim',
    dependencies = {
      'jmbuhr/otter.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    ft = { 'quarto', 'markdown', 'python' },
    config = function()
      require('quarto').setup {
        lspFeatures = {
          enabled = true,
          chunks = 'curly',
          languages = { 'python', 'bash' },
          diagnostics = {
            enabled = true,
            triggers = { 'BufWritePost' },
          },
        },
        codeRunner = {
          enabled = true,
          default_method = 'molten',
        },
      }

      -- Keybindings for running cells
      local runner = require 'quarto.runner'
      vim.keymap.set('n', '<localleader>rc', runner.run_cell, { desc = 'run cell', silent = true })
      vim.keymap.set('n', '<localleader>ra', runner.run_above, { desc = 'run cell and above', silent = true })
      vim.keymap.set('n', '<localleader>rA', runner.run_all, { desc = 'run all cells', silent = true })
      vim.keymap.set('n', '<localleader>rl', runner.run_line, { desc = 'run line', silent = true })
      vim.keymap.set('v', '<localleader>r', runner.run_range, { desc = 'run visual range', silent = true })
      vim.keymap.set('n', '<localleader>RA', function()
        runner.run_all(true)
      end, { desc = 'run all cells of all languages', silent = true })
    end,
  },
}
