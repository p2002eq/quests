function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("If you are not an adept in the ways of poison making. then be off with you. I have neither the time nor the desire to stand idle and make pointless chit-chat with anyone. else it yields a considerable profit worthy of my time.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
