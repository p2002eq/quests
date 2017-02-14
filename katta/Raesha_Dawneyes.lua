function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Welcome friend! You have come to the right place if you are looking to learn how to sew the finest tailored garments in all of Luclin!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end