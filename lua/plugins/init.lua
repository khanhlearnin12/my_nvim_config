-- ~/.config/nvim/lua/plugins/init.lua

-- Create a table to hold all plugin specifications
local specs = {}

-- every plugins go here
-- Load your separated plugin file (obsidian.lua)
table.insert(specs, require("plugins.obsidian"))
-- table.insert(specs, require("plugins.smear_cursor"))
table.insert(specs, require("plugins.neoscroll"))
table.insert(specs, require("plugins.smoothcursor"))
table.insert(specs, require("plugins.rename_variable"))
table.insert(specs, require("plugins.conform"))
table.insert(specs, require("plugins.mason"))
table.insert(specs, require("plugins.autopair"))
table.insert(specs, require("plugins.folk_lazy"))
table.insert(specs, require("plugins.bars"))
table.insert(specs, require("plugins.spotify"))
table.insert(specs, require("plugins.imgclip"))
table.insert(specs, require("plugins.blinkcmp"))

-- You would add more plugin files here as you create them:
-- table.insert(specs, require("plugins.telescope"))
-- table.insert(specs, require("plugins.colorscheme"))

-- Return the final list of specifications
return specs
