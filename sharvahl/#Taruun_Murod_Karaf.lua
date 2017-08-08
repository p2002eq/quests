function event_waypoint_arrive(e)
	if(e.wp == 22) then
		e.self:Emote("orders a drink.");
	end
	if(e.wp == 39) then
		e.self:SetAppearance(1);
	end
	if(e.wp == 63) then
		e.self:SetAppearance(3);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
