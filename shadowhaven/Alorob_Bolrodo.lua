function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Hello there ".. e.other:GetName() .."! I sell all of the finest vegetables that are grown here in the Haven.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end