function event_say(e) --Unknown text
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.self,e.trade, {item1 = 14815})) then -- Daeliones Implant
		---- Commander Streaven **need to find loc and put in game eq.unique_spawn()
	end
	item_lib.return_items(e.self, e.other, e.trade)
end