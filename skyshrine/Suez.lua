function event_say(e)
	if(e.message:findi("hail") then
		e.self.Say("Yes? Can't you see we are busy here.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

#END of FILE Zone:skyshrine  ID:Not_Found -- Suez