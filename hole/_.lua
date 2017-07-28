function event_spawn(e)
	eq.set_timer("appearance", 1000);
end

function event_timer(e)
	eq.stop_timer("appearance");
	e.self:SetAppearance(3);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end