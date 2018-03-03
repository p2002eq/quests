function event_trade(e)
	local item_lib = require("items");
	
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30264,item2 = 30264,item3 = 30264, item4 = 30264})) then 
			e.self:Say("You have chosen wisely, my friend. Take this note as a token of my blessing upon you.");
			e.other:QuestReward(e.self,0,0,0,0,0,100); 
			eq.spawn2(118026,0,0,3172,-5931,-107.2,161); -- #spawn the bloody gnome captive
			eq.depop_with_timer();
		end
	
	item_lib.return_items(e.self, e.other, e.trade)
end
