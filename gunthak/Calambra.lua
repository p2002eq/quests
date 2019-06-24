function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("I'm afraid I can't speak right now, ".. e.other:GetName() .. ". I'm waiting for someone very important to arrive.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end