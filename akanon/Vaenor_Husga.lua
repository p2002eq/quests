-- Converted to .lua by Speedz

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18702})) then
		e.other:SummonItem(13524);	-- Dark Gold Felt Robe*
		e.other:Faction(71,10,0); 	-- Dark reflection
		e.other:Faction(91,-15,0); 	-- eldritch collective
		e.other:Faction(115,-15,0); -- gem choppers
		e.other:Faction(76,-15,0); 	-- Deepmuses
		e.other:Ding();
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
