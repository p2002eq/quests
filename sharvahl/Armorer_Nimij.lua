function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Are you looking for something special, friend?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
