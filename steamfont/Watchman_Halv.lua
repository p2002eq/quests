function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	e.self:Say("What a glorious machine the cargo clockwork is!!");
	eq.signal(56105,1);
end