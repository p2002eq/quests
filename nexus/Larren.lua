function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Oh. welcome " .. e.other:GetName() .. "!  Beyond me is perhaps the best place in all of Lu... well. Norrath now too.  You really need to check it out for yourself. It is the perfect place for a trader like yourself to find the best deal on any item around!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end