----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Treasurer Ma`Quivo (201259)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("")) then -- Anything said
        e.self:Emote("glares at you and does not respond.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end