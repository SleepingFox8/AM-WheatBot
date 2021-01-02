--functions 
    function summonItem(sitem, prefSlot)
        local inv = openInventory()
        local map = inv.mapping.inventory
        prefSlot = prefSlot or 1
        
        --select item if it's in hotbar
            for i,j in pairs(map.hotbar) do
                local item = inv.getSlot(j)
                if item and item.id==sitem then
                    setHotbar(i)
                    return j
                end
            end
        -- select item if it's in inventory     
            for i,j in pairs(map.main) do
                local item = inv.getSlot( j )
                
                
                if item and (item.id==sitem) then
                    --debug
                        boolValue = item.id==sitem
                    setHotbar(prefSlot)
                    local p = map.hotbar[prefSlot]
                    inv.click(j)
                    sleep(40)
                    inv.click(p)
                    sleep(40)
                    if inv.getHeld() then
                        inv.click(j)
                        sleep(40)
                    end
                    if not optInv then
                        inv.close()
                    end
                    return prefSlot
                end
            end
        -- the item is not in players inventory
            log("Could not find item...")
            return false
    end

    function dropAllSeeds()

        --get inventory
            local inv = openInventory()
            local map = inv.mapping.inventory
        --count seeds in inventory
            local numseeds = 0
            local sitem = "minecraft:wheat_seeds"
            --select item if it's in hotbar
                for i,j in pairs(map.hotbar) do
                    local item = inv.getSlot(j)
                    if item and item.id==sitem then
                        numseeds = numseeds + 1
                    end
                end
            -- select item if it's in inventory     
                for i,j in pairs(map.main) do
                    local item = inv.getSlot( j )
        
                    if item and (item.id==sitem) then
                        numseeds = numseeds + 1
                    end
                end

        --drop all but 3 stacks of seeds
            while numseeds > 0 do
                summonItem("minecraft:wheat_seeds", workSlot)
                    drop(true)
                    sleep(100)

                --keep at end of while
                    numseeds = numseeds - 1
            end
    end

--main program
    dropAllSeeds()