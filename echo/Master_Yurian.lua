function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("You have a lot of nerve wandering in here.  We'll be watching you carefully.  Try anything and it will be the last thing you ever try.");
        e.self:Say("I may be a Magician of small stature. but that belies my not so small power.  If you are worthy I may be able to teach you.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end