local M = {}

local nls = require "null-ls"
local nls_utils = require "null-ls.utils"
local b = nls.builtins

local with_diagnostics_code = function(builtin)
  return builtin.with {
    diagnostics_format = "#{m} [#{c}]",
  }
end

local sources = {
  -- formatting
  b.formatting.prettierd,
  b.formatting.shfmt,
  b.formatting.gofmt,
  b.formatting.latexindent,
  b.formatting.nimpretty,
  b.formatting.stylua.with {
    extra_args = { "--config-path", vim.fn.expand "~/.config/nvim/stylua.toml" },
  },
  b.formatting.black.with { extra_args = { "--fast" } },
  -- b.formatting.isort,

  -- diagnostics
  b.diagnostics.write_good,
  -- b.diagnostics.markdownlint,
  -- b.diagnostics.eslint_d,
  b.diagnostics.flake8,
  -- b.diagnostics.staticcheck, -- go linter, but auto-called from gopls
  -- b.diagnostics.tsc,
  b.diagnostics.selene.with {
    extra_args = { "--config", vim.fn.expand "~/.config/nvim/selene.toml" },
  },
  b.diagnostics.ansiblelint,
  b.diagnostics.chktex,
  with_diagnostics_code(b.diagnostics.shellcheck),

  -- code actions
  b.code_actions.gitsigns,
  -- b.code_actions.gitrebase,

  -- hover
  b.hover.dictionary,
}

function M.setup(opts)
  nls.setup {
    -- debug = true,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = opts.on_attach,
    root_dir = nls_utils.root_pattern ".git",
  }
end

return M
