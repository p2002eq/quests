function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("What ya want? You wouldn't be one of them Talikars come lookin for who robbed your gran daddys grave would ya? Hahaha. Get lost!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end