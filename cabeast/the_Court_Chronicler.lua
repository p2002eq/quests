function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Greetings, ".. e.other:GetName() .. ". May I interest you in one of the tomes of our history?");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end
