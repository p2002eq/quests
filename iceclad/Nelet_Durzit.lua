-- Captain Nalot's Triple Strength Rum
function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 34066})) then -- Capt. Nalot's Triple Strength Rum
        e.self:Emote("greedily swigs rum from the jug. After a few drinks, he starts to gag and make faces. 'Oh geez! Rendap told me this stuff was strong, but this tastes like clockwork grease! It burns but now I feel - ugh.'");
        e.self:Emote("doubles over and passes out on the ground. As he falls over, a small silver trinket slips out of his pocket.");
        e.other:QuestReward(e.self,0,0,0,0,30033,10000); -- Rough Silver Chain
    end
    item_lib.return_items(e.self, e.other, e.trade)
end