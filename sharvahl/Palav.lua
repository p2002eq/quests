function event_signal(e)
	e.self:Emote("purrs at Warder Keeper Jyk.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
