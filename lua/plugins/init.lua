-- ~/.config/nvim/lua/plugins/init.lua

-- Create a table to hold all plugin specifications
local specs = {}

-- Load your separated plugin file (obsidian.lua)
table.insert(specs, require("plugins.obsidian"))
-- table.insert(specs, require("plugins.smear_cursor"))
table.insert(specs, require("plugins.neoscroll"))
table.insert(specs, require("plugins.smoothcursor"))
table.insert(specs, require("plugins.rename_variable"))
table.insert(specs, require("plugins.conform"))
table.insert(specs, require("plugins.mason"))

-- You would add more plugin files here as you create them:
-- table.insert(specs, require("plugins.telescope"))
-- table.insert(specs, require("plugins.colorscheme"))

-- Return the final list of specifications
return specs
