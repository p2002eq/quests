function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("We must not let the Gor Taku hunters roam through the thicket. They will reduce our food supply by hunting the hoppers we use for meat. They also aid those blasted bandits that raid our merchant routes. We must put a stop to them.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
