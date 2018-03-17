---- Quest:The Eye of Trust
function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3878})) then -- A Heavy Coin
        e.self:Emote("turns to look at you for a moment, but does not appear to notice that you made the swap.");
        e.other:Faction(139,10); -- Hand of Seru
        e.other:Faction(96,-1); -- Eye of Seru
        e.other:Faction(142,-1); -- Heart of Seru
        e.other:Faction(284,1); -- Seru
        e.other:Faction(138,-1); -- Hand Legionnaries
        e.other:Faction(350,-1); -- Validus Custodus
        e.other:Faction(206,-2); -- Magus Conlegium
        e.other:QuestReward(e.self,0,0,0,0,3879,1000); -- Official Seal of the Hand
    end
    item_lib.return_items(e.self, e.other, e.trade)
end