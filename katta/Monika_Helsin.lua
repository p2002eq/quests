function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Welcome to the fine gems and jewelry section of Adornments of the Night! You will find our gems to be the finest cut and purest quality gems available for all your jewelry needs!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end