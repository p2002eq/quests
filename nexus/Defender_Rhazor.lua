function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Another traveler has come to our lands. Rinkes. I wish you the best of luck wherever your travels may take you. " .. e.other:GetName() .. ".");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end