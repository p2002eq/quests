function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. traveler. If you be interested in brewing. then you've come to the right man. My wares are for producing the most tasty beverages in all of New Tanaan. and they are yours to purchase should you wish.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
