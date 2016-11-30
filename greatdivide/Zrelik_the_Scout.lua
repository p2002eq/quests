followID = 0;

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello... %s!",e.other:GetCleanName()));
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30369})) then -- 9th ring
		e.self:Say("Ring turned in")
		e.other:AddEXP(20000);
		e.other:SummonItem(30369)
		followID = e.other:GetID()
		eq.follow(followID)
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_signal(e)
	eq.follow(followID)
end