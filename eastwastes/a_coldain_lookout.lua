-- Part of Coldain Ring 5

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 30136})) then

		e.self:Shout("Aahhh.. You're too late! They're upon us! To arms, men! Death to Scarbrow!");
		eq.spawn2(116570, 0, 0, -642, -2591, 190, 0);
		eq.get_entity_list():GetMobByNpcTypeID(116570):CastToNPC():SignalNPC(1);	
		e.other:Faction(49, 30);
		e.other:Faction(67, 30);
		e.other:Faction(188, -30);
		e.other:Faction(189, -30);	
	end

end
