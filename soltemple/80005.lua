function event_say(e)
	if(e.message:findi("solusek ro")) then
		e.self:Say("Solusek Ro is the Master of Fire and the Keeper of Power.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
