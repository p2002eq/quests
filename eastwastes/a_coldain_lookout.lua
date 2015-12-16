-- Part of Coldain Ring 5

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 30136})) then

		e.self:Shout("Aahhh.. You're too late! They're upon us! To arms, men! Death to Scarbrow!");
		eq.load_encounter("RingFive");
		e.other:Faction(49, 30);
		e.other:Faction(67, 30);
		e.other:Faction(188, -30);
		e.other:Faction(189, -30);	
		eq.set_timer("depop", 600000); --10 minutes
		eq.depop_with_timer();
	end

end

function event_timer(e)
	if (e.timer == "depop") then
		eq.stop_timer("depop");
		eq.unload_encounter("RingFive");
		eq.depop_all(116586); --invaders
		eq.depop_all(116587); --oracles
		eq.depop(116600); --Scarbrow
	end

end
