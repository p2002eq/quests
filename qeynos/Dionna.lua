function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13708})) then -- Note From Fabian
		e.self:Say("Ah, well, Fabian said to give you this. It really is a good piece. Good luck!");
		e.other:Faction(192, 1,0);
		e.other:Faction(184, 1,0);
		e.other:Faction(135, 1,0);
		e.other:Faction(273, -1,0);
		e.other:Faction(207, -1,0);
		e.other:QuestReward(e.self,0,0,0,0,11010,5000); -- Placeholder Scroll
	end
	item_lib.return_items(e.self, e.other, e.trade)
end