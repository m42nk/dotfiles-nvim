--  This function gets run when an LSP connects to a particular buffer.
return function(_, bufnr)
  require("user.lsp.keymaps")(bufnr)  
end
