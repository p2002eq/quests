function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Welcome " .. e.other:GetName() .. "! We're here watching some goods for Ryann. I guess you could say we're his personal bodyguards.' Serena smiles.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end