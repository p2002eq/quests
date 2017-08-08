function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail.  I urge you not to venture too far from the outpost.  We may not hear your cries for help.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end