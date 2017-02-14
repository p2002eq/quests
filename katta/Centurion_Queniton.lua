function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Greetings adventurer! I am sorry but I can not engage in conversation while I am on duty. you never know when an enemy will show itself.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end