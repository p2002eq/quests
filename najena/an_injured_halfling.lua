function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13009})) then
		e.self:Say("Your kindness is appreciated! If someone can bring me more of these, I might make it out alive!");
		e.other:SummonItem(34028);
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end