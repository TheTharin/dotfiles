local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("tharin.lsp.lsp-installer")
require("tharin.lsp.handlers").setup()
