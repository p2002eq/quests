function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("It is assumed that the froglok stronghold is well defended. None of the troopers sent from this garrison to find it have ever returned.  At least. not in one piece.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
