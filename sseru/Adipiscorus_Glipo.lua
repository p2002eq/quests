function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What do you want?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end