local followID = 0;

function event_spawn(e)
	followID = 0;
end

function event_say(e)
	if(e.message:findi("hail")) then
		if e.other:GetID() == followID then
			e.self:Say("What are your orders sir?");
		else
			e.self:Say(string.format("Hail %s, please be careful out there.",e.other:GetCleanName()));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18511})) then -- Orders of Engagement
		followID = e.other:GetID();
		eq.follow(followID);
	end

	item_lib.return_items(e.self, e.other, e.trade);
end

function event_signal(e)
	if followID ~= 0 then
		eq.follow(followID);
	end
end