function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("I got the great job of being flag boy. I'm so happy. Can't you tell by the look on my face.");
        e.self:Emote("grins");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end