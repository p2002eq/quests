function event_say(e)
	if(e.message:findi("hail") then 
		e.self.Say("Hello, " ..e.other.GetCleanName()..". I would be careful around the cubes. Rumor is they've gotten some kind of intelligence now.")
end	
function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

