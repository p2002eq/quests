---- Quest:The Conspiracists: Arbogast and Miller
function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("I think you should take it easy with that ale there, Yavik.");
    end
end