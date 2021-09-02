-- initialization
    -- ensure imports are from file instead of cache
        local function import(path)
            package.loaded[path] = nil
            local imported = require (path)
            package.loaded[path] = nil
            return imported
        end
    -- import dependancies
        local botTools = import("AM-BotTools/botTools")
-- main program
    botTools.dropAllOfItemExcept("minecraft:wheat_seeds",3)