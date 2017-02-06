function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hail friend! I've got a well stocked supply of alchemical herbs for sale. If you're interested you're welcome to browse my wares.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end