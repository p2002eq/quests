function event_death_complete(e)
	e.self:Say("Never.. to feel the mist.. again..");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end