local colorscheme = "custom_nord"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
--vim.cmd [[ hi Normal guibg=NONE ]]

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

