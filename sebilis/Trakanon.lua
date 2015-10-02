function event_spawn(e)
	eq.depop(89181);
    eq.depop(89168);
end
function event_death_complete(e)
    eq.signal(89185, 1) -- signal UDB controller
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end