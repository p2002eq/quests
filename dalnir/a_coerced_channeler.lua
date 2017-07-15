-- Shaman Skull Quest 6
function event_death_complete(e)
	e.self:Shout("the river of Xinth...");
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	local item_lib = require("items");
	if(tonumber(qglobals.shmskullquest) >= 9 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12752})) then -- A Potion of Swirling Liquid
		e.other:QuestReward(e.self,0,0,0,10,12750,0); -- An Iksar Skull
		e.self:Shout("Go to where the pines have been smashed. Must reach great heights!");
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end