--NPC:  Spirit of Garzicor  v1 (Gold Tinted Diamond)
--zone: necropolis
function event_spawn(e)
	eq.set_timer("depop", 10*60*1000); 	--10min depop
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	--Quest Trade Dialog for Spirit of Garzicor (Quest Gem returned for 1 Flawless Diamond)	
	if (qglobals["garzicor"] == "7") then	--check to verify previous portions have been complete
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 25814})) then	--Check for Flawless Diamond
			eq.unique_spawn(123254,0,0,1045,1527,-135,390.0) for final hand-in
			e.other:QuestReward(e.self,0,0,0,0,2091,0);			--Gold Tinted Diamond
			eq.set_timer("depop",1);	--despawns Garzicor`s Shade
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
