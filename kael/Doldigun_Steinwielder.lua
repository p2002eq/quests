function event_spawn(e)
	eq.set_timer("depop", 10*60*1000); --10 min despawn if event isn't started
end

function start_cycle(e)
	e.self:Emote("calls for help and scurries off.");
	eq.spawn2(113626,28,0,1130.3,-933.2,-125.6,126.6);
	eq.spawn2(113633,29,0,1130.3,-749.6,-125.6,126.6);
	eq.stop_timer("depop");
	eq.depop();
end

function event_combat(e)
    start_cycle(e);
end

function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 18172})) then
	    e.other:QuestReward(e.self,0,0,0,0,1464);   -- Ring of the Coldain Council
        start_cycle(e);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end