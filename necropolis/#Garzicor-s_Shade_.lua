--NPC:  Spirit of Garzicor  v2 (Blackened Diamond)
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
			e.other:QuestReward(e.self,0,0,0,0,2090,0);			--Blackened Diamond
			eq.set_timer("depop",1);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end