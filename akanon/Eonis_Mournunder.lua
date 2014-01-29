-- Converted to .lua by Speedz

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18771})) then -- Stained Letter
		e.self:Say("Hmmm.. As you wish, we will train you in our dark ways, but, now this, our art carries a high price, and there is no turning back for you now.");
		e.other:SummonItem(13524); 	-- Dark Gold Felt Robe*
		e.other:Ding();
		e.other:Faction(71,10,0); 	-- Dark Reflection
		e.other:Faction(91,-15,0); 	-- Eldritch Collective
		e.other:Faction(115,-15,0); 	-- Gem Choppers
		e.other:Faction(76,-15,0); 	-- Deepmuses
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
