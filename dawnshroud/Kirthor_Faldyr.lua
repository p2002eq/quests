function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Would you mind backing away from me please. I can smell the ale on your breathe. It's not very pleasant.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end