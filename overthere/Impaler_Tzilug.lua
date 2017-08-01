-- Test of Charm - enchanter epic - Enchanted Emerald
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10634})) then
		e.self:Say("Your bidding has been done, now leave this land and never return.");
		e.other:QuestReward(e.self,0,0,0,0,10621,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
