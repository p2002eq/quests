function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("I agree with Karim. I went on a scouting mission into the gor taku caves, they were definitely building fortifications. They have a slew of builders constructing defences from the stones collected by the workers. We have to strike them before they have finished their preperations for battle.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
