function event_spawn(e)
	followID = 0;
	ready = false;
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
	
	if ready and item_lib.check_turn_in(e.self, e.trade, {item1 = 18511}) then -- Orders of Engagement
		e.self:Say(string.format("At yer service, %s. Remember now, before issuing me an order ya must disengage from any combat and be sure yer speakin to me. I advise you to avoid combat at all costs, your leadership is crucial.",e.other:GetCleanName()));
		followID = e.other:GetID();
		eq.follow(followID);
		eq.signal(118351, 101); -- advance stage of encounter
		eq.signal(118351, 61, 1000); -- send Aldikar walking to the waterfall
		ready = false;
	end

	item_lib.return_items(e.self, e.other, e.trade);
end

function event_signal(e)
	if e.signal == 100 then
		ready = true;
	end

	if followID ~= 0 then
		eq.follow(followID);
	end
end