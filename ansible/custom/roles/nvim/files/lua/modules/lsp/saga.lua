local ok, saga = pcall(require, "lspsaga")
if (not ok) then return end

saga.init_lsp_saga({
  code_action_icon = " ",
  definition_preview_icon = "  ",
  diagnostic_header_icon = "   ",
  error_sign = " ",
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  hint_sign = "⚡",
  infor_sign = "",
  warn_sign = "",
})
