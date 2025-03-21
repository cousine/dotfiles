local function get_go_module_name()
  local mod_file = vim.fn.findfile("go.mod", ".;")
  if mod_file == "" then
    return ""
  end

  local file = io.open(mod_file, "r")
  if not file then
    return ""
  end

  local module_name = ""
  for line in file:lines() do
    module_name = line:match("^module%s+(.+)")
    if module_name then
      break
    end
  end
  file:close()
  return module_name or ""
end

return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
      },
      formatters = {
        goimports = {
          args = function()
            local module = get_go_module_name()
            return module ~= "" and { "-local", module } or {}
          end,
        },
      },
    },
  },
}
