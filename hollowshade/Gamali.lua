--Art of Vah Shir Brewing
function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16598})) then -- Bottle
        e.self:Say("Well " .. e.other:GetName() .. ". I bet you are here for some fresh water. Just so happens I have some. Enjoy!"); -- adlib
        e.other:QuestReward(e.self,0,0,0,0,31761); -- Bottle of fresh water
    end
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16598, item2 = 16598})) then -- 2x Bottle
        e.self:Say("Well " .. e.other:GetName() .. ". I bet you are here for some fresh water. Just so happens I have some. Enjoy!"); -- adlib
        e.other:SummonItem(31761); -- Bottle of fresh water
        e.other:QuestReward(e.self,0,0,0,0,31761); -- Bottle of fresh water
    end
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16598, item2 = 16598, item3 = 16598})) then -- Bottle
        e.self:Say("Well " .. e.other:GetName() .. ". I bet you are here for some fresh water. Just so happens I have some. Enjoy!"); -- adlib
        e.other:SummonItem(31761); -- Bottle of fresh water
        e.other:SummonItem(31761); -- Bottle of fresh water
        e.other:QuestReward(e.self,0,0,0,0,31761); -- Bottle of fresh water
    end
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16598, item2 = 16598, item3 = 16598, item4 = 16598})) then -- Bottle
        e.self:Say("Well " .. e.other:GetName() .. ". I bet you are here for some fresh water. Just so happens I have some. Enjoy!"); -- adlib
        e.other:SummonItem(31761); -- Bottle of fresh water
        e.other:SummonItem(31761); -- Bottle of fresh water
        e.other:SummonItem(31761); -- Bottle of fresh water
        e.other:QuestReward(e.self,0,0,0,0,31761); -- Bottle of fresh water
    end
    item_lib.return_items(e.self, e.other, e.trade)
end