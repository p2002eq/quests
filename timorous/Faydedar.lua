function event_spawn(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(96073)) then
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
