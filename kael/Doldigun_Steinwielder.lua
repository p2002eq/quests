function start_cycle(e)
	e.self:Emote("calls for help and scurries off.");
	eq.spawn2(113626,28,0,1130.3,-933.2,-125.6,126.6);
	eq.spawn2(113633,29,0,1130.3,-749.6,-125.6,126.6);
	eq.depop_with_timer();
end

function event_combat(e)
    start_cycle(e);
end

function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 18172})) then
        start_cycle(e);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
