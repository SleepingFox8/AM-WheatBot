# WheatBot

WheatBot is a minecraft bot written for [advanced macros mod](https://www.curseforge.com/minecraft/mc-mods/advanced-macros) v9.2.0 that auto harvests and replants wheat fields.
 
![](https://i.imgur.com/m3fiw0M.png)

![](https://i.imgur.com/EmiDo2q.png)

## Farm Setup

Farms can be a rectangle of any size, as long as they are flat. Water sources should be able to be walked over without jumping. The sourthern most edge of the farm should have fence that items will be thrown against before being collected into a hopper collection sysem via water.

## Usage

- In ``wheatBot.lua``, assign ``FUNC.farmz`` and ``FUNC.farmx`` to  the dimensions of your specific wheat field.
- Make room in the player's inventory for collecting wheat and seeds.
- Ensure the player has at least one stack of seeds in their inventory before starting
- Stand on the south western most point of their farm (indicated in the above pictures with a gold block), and run ``farmWheat.lua``
