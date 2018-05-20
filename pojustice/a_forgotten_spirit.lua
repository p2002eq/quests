----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: a forgotten spirit (201133)
----------------------------------------------------------------------

function event_say(e)
	e.self:Message(15,"You can't think of any reason why you would be here.");
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end