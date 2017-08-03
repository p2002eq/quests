function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("turns a condescending eye toward you. 'I am quite busy here. and I do not appreciate interruptions.  My research is important. and I do not have time to explain everything to you.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
