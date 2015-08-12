function event_death_complete(e)
    eq.signal(92252, 1) -- signal cycle controller
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end