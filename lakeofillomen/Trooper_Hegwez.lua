function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. adventurer!  Stay close to the gates or risk your life.  The Lake of Ill Omen is aptly named.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end