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
        local compTools = import("AM-CompTools/compTools")
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

    -- set farm size
        MAIN.player = getPlayer()
        MAIN.xpos = math.floor(MAIN.player.pos[1])
        MAIN.farmx = (1602 - MAIN.xpos) + 1
        MAIN.farmz = 108

        --DEBUG
            -- MAIN.farmz = 5
            -- MAIN.farmx = 4

    -- harvest farm
        log("&7[&6Bots&7] &6* &aStarting Harvest")
        wheatBot.harvestField(MAIN.farmx, MAIN.farmz)
        log("&7[&6Bots&7] &6* &aHarvest completed...")