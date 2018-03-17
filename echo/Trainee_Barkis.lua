function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("We know who you are.  Give me the slightest reason and I will call the scounds upon your head.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end