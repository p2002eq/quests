function event_spawn(e)
	local qglobals = eq.get_qglobals(e.self);	
	eq.depop(89181);
    eq.depop(89168);
	if qglobals.UDB_timer ~= nil then
		eq.delete_global("UDB_timer");
	end
end
function event_death_complete(e)
    eq.signal(89185, 1) -- signal UDB controller
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end