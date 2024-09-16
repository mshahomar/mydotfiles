-- Override Lua version check
local lazy_rocks = require("lazy.util.rocks")
lazy_rocks.lua_version = function()
  return "5.4.7"
end
