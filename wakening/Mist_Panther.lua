-- Captain Nalot's Triple Strength Rum
function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30066, item2 = 30066, item3 = 30066, item4 = 30066})) then -- 4x Fresh Chunk of Wooly Rhino
        e.self:Emote("jumps at you and snatches the meat from your hand. It runs away from you and feasts on the other side of the water. As it runs away you notice a small shiny object fall from its mouth.");
        e.other:QuestReward(e.self,0,0,0,0,30057,10000); -- Golden Broken Key
    end
    item_lib.return_items(e.self, e.other, e.trade)
end