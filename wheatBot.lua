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
    -- prepair table for holding exported functions
        local wheatBot = { _version = "0.0.0" }

-- functions
    local function offload(zpos, zorigin)
        -- function initialization
            -- declare table to hold all FUNC scoped variables in
                local FUNC = {}
            -- store func args in scope-safe table
                FUNC.zpos, FUNC.zorigin = zpos, zorigin

        --look south
            look(0,0)
            sleep(100)
        botTools.dropAllOfItemExcept("minecraft:wheat")
        sleep(1000)
        --look west and up 45 degrees
            look(90,-45)
            sleep(100)
        botTools.dropAllOfItemExcept("minecraft:wheat_seeds",3)
    end

    local function getToTarget(ztarg, xtarg)
        -- function initialization
            -- declare table to hold all FUNC scoped variables in
                local FUNC = {}
            -- store func args in scope-safe table
                FUNC.ztarg, FUNC.xtarg = ztarg, xtarg

        -- get FUNC.player information
            FUNC.player = getPlayer()
            FUNC.xpos = math.floor(FUNC.player.pos[1])
            FUNC.ypos = math.floor(FUNC.player.pos[2])
            FUNC.zpos = math.floor(FUNC.player.pos[3])
        
        -- while not on target
        while FUNC.zpos ~= FUNC.ztarg or FUNC.xpos ~= FUNC.xtarg do
            -- get FUNC.player information
                FUNC.player = getPlayer()
                FUNC.xpos = math.floor(FUNC.player.pos[1])
                FUNC.ypos = math.floor(FUNC.player.pos[2])
                FUNC.zpos = math.floor(FUNC.player.pos[3])
            -- walk towards target
                lookAt(FUNC.xtarg+0.5, -90, FUNC.ztarg+0.5)
                forward(50)
        end
        -- stop moving
            forward(0)
    end

    local function harvestAndReplant(workSlot)
        -- function initialization
            -- declare table to hold all FUNC scoped variables in
                local FUNC = {}
            -- store func args in scope-safe table
                FUNC.workSlot = workSlot

        botTools.summonItem("minecraft:wheat_seeds", FUNC.workSlot)
        sleep(50)
        attack()
        sleep(200)
        use()
        -- sleep(250)
    end

    function wheatBot.harvestField(farmx, farmz)
        -- function initialization
            -- declare table to hold all FUNC scoped variables in
                local FUNC = {}
            -- store func args in scope-safe table
                FUNC.farmx = farmx
                FUNC.farmz = farmz

        -- get FUNC.player information
            FUNC.player = getPlayer()
            FUNC.xpos = math.floor(FUNC.player.pos[1])
            FUNC.ypos = math.floor(FUNC.player.pos[2])
            FUNC.zpos = math.floor(FUNC.player.pos[3])

            FUNC.workSlot = 2

        -- set bot origin point
            FUNC.player = getPlayer()
            FUNC.xorigin = math.floor(FUNC.player.pos[1])
            FUNC.yorigin = math.floor(FUNC.player.pos[2])
            FUNC.zorigin = math.floor(FUNC.player.pos[3])

        -- for x,y in farmGrid[]
            -- for each row
                FUNC.direction = "north"
                for x=FUNC.xorigin, FUNC.xorigin + FUNC.farmx - 1, 1 do
                    
                    --for each block in row
                        -- north
                            if FUNC.direction == "north" then
                                for z=FUNC.zorigin, FUNC.zorigin - FUNC.farmz+1,-1 do
                                    getToTarget(z,x)
                                    harvestAndReplant()
                                    botTools.eatIfHungry()
                                end
                        -- south
                            else
                                for z= FUNC.zorigin - FUNC.farmz+1, FUNC.zorigin, 1 do
                                    getToTarget(z,x)
                                    harvestAndReplant()
                                    botTools.eatIfHungry()
                                end
                                sleep(100)
                                offload()
                            end
                    -- keep at end of for loop
                        -- toggle FUNC.direction
                            if  FUNC.direction == "north" then
                                FUNC.direction = "south"
                            else
                                FUNC.direction = "north"
                            end
                end
    end

return wheatBot