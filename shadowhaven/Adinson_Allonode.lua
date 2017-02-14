function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hello there. I run this jewelry shop with my husband Garn. Please let me know how I can be of assistance.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end