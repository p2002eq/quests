function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. adventurer!  Watch your step and don't get lost in the swamplands.  The frogloks will have you for stew.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
