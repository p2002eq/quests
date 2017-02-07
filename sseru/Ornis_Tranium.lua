---- Quest:The Eye of Trust
function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3880})) then -- A Vial of Thick Liquid
        e.self:Emote("gasps suddenly then falls still.");
        e.other:Faction(96,10); -- eye of seru
        e.other:Faction(139,-1); -- hand of seru
        e.other:Faction(142,-1); -- heart of seru
        e.other:Faction(284,1); -- seru
        e.other:Faction(141,-1); -- haven smugglers
        e.other:Faction(350,-1); -- validus custodus
        e.other:Faction(206,-2); -- magus conlegium
        e.other:QuestReward(e.self,0,0,0,0,3882,1000); -- An Empty Poison Vial
    end
    item_lib.return_items(e.self, e.other, e.trade)
end