function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("You have a lot of nerve wandering in here.  We'll be watching you carefully.  Try anything and it will be the last thing you ever try.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end