function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome. traveler! If you are in need of supplies to brew potions. then you have come to the right man! Please. search my wares and perhaps you may find what you need.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
