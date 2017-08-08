function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("May your ancestors guide your heart noble wanderer. It is good to meet you. Please. have a look at my wares. I have quality armor made from leather and padded for extra comfort and protection.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
