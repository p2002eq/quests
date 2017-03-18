---- Quest:The Eye of Trust
function event_spawn(e)
    e.self:doanim(16); -- Death/Laying Down
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3880, item2 = 3879})) then -- A Vial of Thick Liquid and Official Seal of the Hand
        e.self:Emote("gasps suddenly then falls still.");
        e.other:Faction(298,10); -- Shoulders of Seru
        e.other:Faction(142,-1); -- Heart of Seru
        e.other:Faction(96,-1); -- Eye of Seru
        e.other:Faction(284,1); -- Seru
        e.other:Faction(1686,-1); -- Katta Castellum Citizens
        e.other:Faction(206,-2); -- Magus Conlegium
        e.other:QuestReward(e.self,0,0,0,0,3882,1000); -- An Empty Poison Vial
    end
    item_lib.return_items(e.self, e.other, e.trade)
end