function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Welcome to The Second Skin Armory! I would recommend a suit of my excellent quality plate armor if you're planning on leaving the protection of the city walls. I wouldn't be caught dead out there without it!! Hahaha!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end