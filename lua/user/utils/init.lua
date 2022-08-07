local M = {}


M.i_hate_packersync = function()
  require("packer").clean()
  require("packer").install()
end

return M
