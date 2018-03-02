--NPC:  Garzicor's Wraith  (Final Dragon)
--zone: necropolis
function event_spawn(e)
	eq.set_timer("depop", 30*60*1000) 	--30 min depop
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.depop();
	end
end

function event_death(e)
	eq.unique_spawn(123253,0,0,975,1521,-141,384.0)
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
