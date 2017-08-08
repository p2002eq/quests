function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Have you tried to drink from the lake?  It is poisoned with salt!  If you plan on venturing to the far side of the lake. you had best visit one of the Kloks to purchase a Water Extractor.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end