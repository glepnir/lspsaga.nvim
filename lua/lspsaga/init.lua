local saga = {}

saga.config_values = {
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  -- jump diagnostic header
  error_header = "  Error",
  warn_header = "  Warn",
  hint_header = "  Hint",
  infor_header = "  Infor",
  max_diag_msg_width = 50,
  -- code action title icon
  code_action_icon = ' ',
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  finder_action_keys = {
    open = 'o', vsplit = 's',split = 'i',quit = 'q'
  },
  code_action_keys = {
    quit = 'q',exec = '<CR>'
  },
  definition_preview_icon = '  ',
  -- 1: thin border | 2: rounded border | 3: thick border
  border_style = 1,
  rename_prompt_prefix = '➤',
  server_filetype_map = {}
}

function saga.extend_config(opts)
  opts = opts or {}
  if next(opts) == nil then return  end
  for key,value in pairs(opts) do
    if saga.config_values[key] == nil then
      error(string.format('[LspSaga] Key %s not exist in config values',key))
      return
    end
    saga.config_values[key] = value
  end
end

function saga.init_lsp_saga(opts)
  saga.extend_config(opts)
  local diagnostic = require 'lspsaga.diagnostic'

  if saga.config_values.use_saga_diagnostic_sign then
    diagnostic.lsp_diagnostic_sign(saga.config_values)
  end
end

return saga
