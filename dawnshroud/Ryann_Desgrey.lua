function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("What brings to our outpost " .. e.other:GetName() .. "? Did you run into [" .. eq.say_link("Anario") .. "] by any chance?");
    elseif(e.message:findi("Anario")) then
        e.self:Say("Anario was supposed to make a delivery some time ago. but he hasn't shown up yet.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end