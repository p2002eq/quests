--Life 
--Plane of Mischief 1.0

--LUA Trigger event to deathtouch character upon hailing NPC

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Shout(string.upper(e.other:GetName()) .. "!"); 
        e.self:SpellFinished(982, e.other);  --cast Cazic Touch (10K unresistable dmg)
    end
end

--standard item return

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

