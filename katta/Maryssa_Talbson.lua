function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("What's your poison friend? Why don't you try some Kerreopi. it's lots of fun!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end