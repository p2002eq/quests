function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Pleased to meet you " .. e.other:GetName() .. ". It's great to have many new visitors in the Haven. Please have a look at what bars I have to offer.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end