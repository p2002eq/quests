function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to Shar Vahl.  You are entering the North Gate District of our city.  Enjoy yourself and stay safe.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
