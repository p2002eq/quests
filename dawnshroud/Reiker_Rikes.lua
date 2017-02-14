---- Quest:Fungus Covered Mushrooms
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("I be Reiker Rikes! The fastest gnome in the woods!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31479})) then -- Fungus Covered Mushroom
        e.self:Emote("grins. 'These should go nicely in my stew.'");
        e.other:QuestReward(e.self,0,0,0,0,0,10000); -- EXP
    end
    item_lib.return_items(e.self, e.other, e.trade)
end