function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Welcome to Luclin Survivalist Supplies. We carry the finest quality products for the adventurer or traveling merchant. May I interest you in a Phosphorescent Lantern?");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end