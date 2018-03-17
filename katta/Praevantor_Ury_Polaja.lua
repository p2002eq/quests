function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Shhh! We must maintain our concentration and please stand back! We are dealing with creatures that could be very dangerous should we loose control over them!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end