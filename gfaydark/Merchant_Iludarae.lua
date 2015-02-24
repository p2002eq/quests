function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18904})) then
		e.self:Say("The slaves...thank you! Here, this will help defend you against those vile orcs.");
		e.other:SummonItem(eq.ChooseRandom(2012,2004,2006,2005,2011));
		e.other:Ding();
		e.other:AddEXP(30000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
