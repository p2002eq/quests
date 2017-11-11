function event_spawn(e)
	local qglobals = eq.get_qglobals(e.self);	
	if qglobals.VSR_timer ~= nil then
		eq.delete_global("VSR_timer");
	end
	eq.depop(102099);	--#VSTrigger
end
function event_death_complete(e)
    eq.signal(102138, 1) -- signal --#VSTrigger
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end