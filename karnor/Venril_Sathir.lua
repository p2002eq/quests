function event_spawn(e)
	eq.depop(102099);
end
function event_death_complete(e)
    eq.signal(102138, 1) -- signal vs controller
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end