function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings!  Are you a mercenary?  If so, I urge you to go and speak with one of the officers of this outpost.  We can always use help in suppressing the goblins and clearing out a killing zone.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end