function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to New Tanaan. friend!  Enjoy your visit and may your quest for enlightenment be a pleasant one!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
