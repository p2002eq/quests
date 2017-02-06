function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Gobu gobu. bakula erila [shamu eku]?");
        e.self:Say("Weeee Weeee! Shamiku! Weeee!");
        e.self:Say("Gobu gobu. bakula erila [shamu eku]?");
    elseif(e.message:findi("shamu eku")) then
        e.self:Say("Weeee Weeee! Shamiku! Weeee!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end