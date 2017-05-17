-- Test of Charm - enchanter epic - Enchanted Ruby
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10633})) then -- Dull Ruby
		e.other:QuestReward(e.self,0,0,0,0,10620); -- Enchanted Ruby
	end
	item_lib.return_items(e.self, e.other, e.trade)
end