-- Captain Nalot's Triple Strength Rum
function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19974})) then -- Jar of Gnomish Cleaning Paste
        e.self:Emote("grins and pours the ooze on his hand and the box. You hear a burning sizzle and then the box thumps onto the ground. 'Ow! Ow! Take it! Hah. I never thought I would get rid of that piece of...");
        e.other:QuestReward(e.self,0,0,0,0,34065,10000); -- Locked Case
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
