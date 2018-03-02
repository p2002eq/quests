--NPC:  Garzicor's Corpse  (Trigger for Garzicor's Wraith)
--zone: necropolis
function event_spawn(e)
	eq.set_timer("depop", 20*60*1000) 	--20min depop
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.depop();
	end
end

function event_death(e)
	eq.unique_spawn(123247,0,0,1095,1511,-135,195);	--spawns Garzicor's Wraith (Final Quest boss)
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end