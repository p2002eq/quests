function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8720})) then -- Phobonomicon of Thul Tae Ew
		eq.depop_all(48095); -- a living void
		eq.spawn2(48323,0,0,-278,951,134,130); -- a horror construct
	end
	item_lib.return_items(e.self, e.other, e.trade);
end