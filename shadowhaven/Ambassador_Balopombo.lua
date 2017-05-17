function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Hello there. do you mean to pay a visit to the Stout Quarter? If so. be warned that this town hall is always monitored and guarded heavily.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end