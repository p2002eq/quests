function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Take a look at my selection of songs and let me know if you have any questions.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
