return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "nvim-treesitter/nvim-treesitter-context" }
  },
  event = "BufRead",
  build = ":TSUpdate",
  ---@class TSConfig
  opts = {
    ensure_installed = {
      "javascript", "typescript", "vue", "c", "rust", "lua", "vim", "vimdoc", "zig" 
    },
  },
  config = function(_, opts)
    -- install parsers from custom opts.ensure_installed
    if opts.ensure_installed and #opts.ensure_installed > 0 then
      require("nvim-treesitter").install(opts.ensure_installed)
      -- register and start parsers for filetypes
      for _, parser in ipairs(opts.ensure_installed) do
        local filetypes = parser -- In this case, parser is the filetype/language name
        vim.treesitter.language.register(parser, filetypes)

        vim.api.nvim_create_autocmd({ "FileType" }, {
          pattern = filetypes,
          callback = function(event)
            vim.treesitter.start(event.buf, parser)
          end,
        })
      end
    end

    require("treesitter-context").setup({
      trim_scope = "inner",
    })
  end,
}

