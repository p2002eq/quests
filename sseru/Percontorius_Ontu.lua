---- Quest:The Eye of Trust
function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3876})) then -- A Heavy Coin
        e.self:Emote("touches the coin to the back of her hand and then look up with a smile. 'Please take this back to it's source,' she says and nods. You feel the coin return to your hand. Your palm tingles slightly and then the sensation fades.");
        e.other:Faction(96,10); -- eye of seru
        e.other:Faction(139,-1); -- hand of seru
        e.other:Faction(142,-1); -- heart of seru
        e.other:Faction(284,1); -- seru
        e.other:Faction(141,-1); -- haven smugglers
        e.other:Faction(350,-1); -- validus custodus
        e.other:Faction(206,-2); -- magus conlegium
        e.other:QuestReward(e.self,0,0,0,0,3877,1000); -- A Heavy Coin
    end
    item_lib.return_items(e.self, e.other, e.trade)
end