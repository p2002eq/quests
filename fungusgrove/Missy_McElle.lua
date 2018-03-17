function event_combat(e)
    if(e.joined == true) then
        e.self:Say("That's the last mistake you'll make!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end