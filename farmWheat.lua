botTools = require ("AM-tools/botTools")
compTools = require ("AM-tools/compTools")
wheatBot = require("./wheatBot")

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