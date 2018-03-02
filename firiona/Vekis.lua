function event_say(e) --Unknown text
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.self,e.trade, {item1 = 14815})) then -- Daeliones Implant
		eq.unique_spawn(84410,0.0, 0, 2130, -2571, 25, 0); 
		---- Commander Streaven *Need dialogue
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
