function event_spawn(e)
	eq.signal(93087,2);
	eq.signal(93186,2);
	eq.signal(93124,2);
	eq.signal(93088,2);
	eq.signal(93084,2);
	eq.signal(93125,2);
	eq.signal(93086,2);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
