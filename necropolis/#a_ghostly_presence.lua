--NPC:  a ghostly presence  (Trigger for Garzicor's Corpse)
--zone: necropolis
function event_spawn(e)
	eq.set_timer("depop", 10*60*1000) 	--10min depop
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
	--Quest Trade Dialog to spawn Garzicor's Corpse
	if (qglobals["garzicor"] == "7") then	--check to verify previous portions have been complete
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2063})) then	--Check for Vial of Kromzek Blood
			eq.unique_spawn(123255,0,0,1095,1511,-135,195);		--spawns Garzicor's Corpse
			eq.set_timer("depop",1);	--depop ghostly presence
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end