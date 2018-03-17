function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hello there " .. e.other:GetName() .. ". Be sure to speak to Kanthek if you're in need of any armor.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end