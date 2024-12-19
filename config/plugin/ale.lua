-- ALE Configuration
vim.g.ale_fixers = {
  ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
  python = {'black', 'isort'},
  javascript = {'prettier', 'eslint'},
  typescript = {'prettier', 'eslint'},
  terraform = {'terraform'},
  lua = {'luafmt'}
}

vim.g.ale_linters = {
  python = {'flake8', 'pylint'},
  javascript = {'eslint'},
  typescript = {'eslint'},
  terraform = {'tflint'},
  lua = {'luacheck'}
}

vim.g.ale_fix_on_save = 1

-- Additional ALE settings
vim.g.ale_sign_error = '✘'
vim.g.ale_sign_warning = '⚠'
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_lint_on_insert_leave = 0
vim.g.ale_lint_on_enter = 0
