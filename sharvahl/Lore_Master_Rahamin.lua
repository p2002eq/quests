function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:SetAppearance(3);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
