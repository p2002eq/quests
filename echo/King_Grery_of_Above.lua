function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Ahh, yes " .. e.other:GetName() .. ".  I always have time for one of my loyal subjects.  Oh... wait, the Court Sage is signaling me that there is an important matter that needs my immediate attention.  Please come back a little later on and I should have some more time for you.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end