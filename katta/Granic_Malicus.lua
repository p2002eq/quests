function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Welcome to Lightening Blades Smithy! If it's excellent quality weapons that you seek than you have come to the right place. You'll not find better blades for sale anywhere on Luclin.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end