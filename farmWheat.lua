-- initialization
    -- ensure imports are from file instead of cache
        local function import(path)
            package.loaded[path] = nil
            local imported = require (path)
            package.loaded[path] = nil
            return imported
        end
    -- import dependancies
        local botTools = import("AM-Tools/botTools")
        local compTools = import("AM-Tools/compTools")
        local wheatBot = import("./wheatBot")

-- main program
    --initialize MAIN table
    --Stores variables for just MAIN function
        local MAIN = {}

    -- toggle this script off it it is already on
        if compTools.anotherInstanceOfThisScriptIsRunning() then
            compTools.stopOtherInstancesOfThisScript()
            log("&7[&6Bots&7] &6* &cFARMING...")
            botTools.freezeAllMotorFunctions()
            -- silently end this script
                return 0
        end


        log("&7[&6Bots&7] &6* &aStarting Harvest")
        wheatBot.harvestField()
        log("Harvest completed...")