----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: warrior of Nel`Ptan (201059)
----------------------------------------------------------------------

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end