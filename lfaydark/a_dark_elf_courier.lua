function event_spawn(e)
	e.self:SetRunning(true);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
