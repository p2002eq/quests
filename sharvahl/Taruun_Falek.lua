function event_waypoint_arrive(e)
	if(e.wp == 11) then
		e.self:Emote("orders a drink.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
