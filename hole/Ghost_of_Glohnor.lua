-- Part of SK Epic 1.0
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14377})) then
		eq.spawn2(39165, 0, 0, 464.4, 819, -678,250.0);
		e.other:Faction(342, 7);
		eq.depop_with_timer();
	end
end
