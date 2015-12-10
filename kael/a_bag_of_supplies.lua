--crest of faun

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 24860, item2 = 24861})) then
		e.other:SummonItem(22855);
		e.self:CastSpell(1644, e.self); --pillar of fire
		eq.depop_with_timer();
	end

	item_lib.return_items(e.self, e.other, e.trade); 	

end
