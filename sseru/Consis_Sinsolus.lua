---- Quest:The Eye of Trust
function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3878})) then -- A Heavy Coin
        e.self:Emote("turns to look at you for a moment, but does not appear to notice that you made the swap.");
        e.other:Faction(96,10); -- eye of seru
        e.other:Faction(139,-1); -- hand of seru
        e.other:Faction(142,-1); -- heart of seru
        e.other:Faction(284,1); -- seru
        e.other:Faction(141,-1); -- haven smugglers
        e.other:Faction(350,-1); -- validus custodus
        e.other:Faction(206,-2); -- magus conlegium
        e.other:QuestReward(e.self,0,0,0,0,3879,1000); -- Official Seal of the Hand
    end
    item_lib.return_items(e.self, e.other, e.trade)
end