function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I'd watch out for the cubes. They've been getting hostile lately.");
	end
end

function event_trade(e)
	item_lib.return_items(e.self,e.other,e.trade);
end
