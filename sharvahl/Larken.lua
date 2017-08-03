function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to our shop.  If you don't see a sketch you need. I can try to whip one up for you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
