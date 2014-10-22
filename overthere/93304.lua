function event_spawn(e)
	eq.signal(93087,1);
	eq.signal(93186,1);
	eq.signal(93124,1);
	eq.signal(93088,1);
	eq.signal(93084,1);
	eq.signal(93125,1);
	eq.signal(93086,1);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
