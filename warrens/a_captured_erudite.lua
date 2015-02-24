function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("bats her eye lashes seductively. 'I would be immensely pleased if someone would free me from these shackles.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 6923})) then
		e.self:Say("I thank you for freeing me from my dog faced captors.");
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
