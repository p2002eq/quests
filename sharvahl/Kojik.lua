function event_spawn(e)
	eq.set_timer("1",75000);
end

function event_timer(e)
	e.self:Say("Bags! Chests! You'll need to carry your treasures, come see what I have for sale.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
