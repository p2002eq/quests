function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. may I help you. friend?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
