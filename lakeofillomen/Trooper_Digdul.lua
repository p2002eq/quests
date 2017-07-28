function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("I've heard rumors of disappearing fishermen on the Lake of Ill Omen. Strange sightings abound. If I were you. I'd do my best to avoid those waters.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end