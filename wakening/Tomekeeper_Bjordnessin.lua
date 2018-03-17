function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1782})) then
		e.self:Say("Amazing! Simply Amazing! The legends must be true! This item was said to have been given to the Dragon Sage as a sign of friendship and trust, but I have always considered it to be legend. The discovery of this artifact will work wonders for my status! I have discovered a legend! Oh... Oh yes. You sought information on that herb. Take this back to the sage. Maybe he can decipher it.");
		e.other:SummonItem(1783);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end