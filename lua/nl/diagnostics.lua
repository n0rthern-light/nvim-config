local diagnostics_enabled = false

local diagnostics_config_enabled = {
  underline = {
    severity = { min = vim.diagnostic.severity.ERROR }
  },
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR }
  }
}
local diagnostics_config_disabled = {
    underline = false,
    virtual_text = false,
    signs = false,
}
local function diagnostics_toggle()
  diagnostics_enabled = not diagnostics_enabled

  if diagnostics_enabled then
    vim.diagnostic.config(diagnostics_config_enabled)
    print("Diagnostics: ON (<leader>dg to toggle)")
  else
    vim.diagnostic.config(diagnostics_config_disabled)
    print("Diagnostics: OFF (<leader>dg to toggle)")
  end
end

return diagnostics_toggle
