function event_waypoint_arrive(e)
	if(e.wp == 18) then
		e.self:Emote("makes a withdrawal");
	end
	if(e.wp == 31) then
		e.self:SetAppearance(1);
	end
	if(e.wp == 46) then
		e.self:SetAppearance(1);
		e.self:Emote("begins her daily weaving with a whistle and a smile.");
	end
	if(e.wp == 71) then
		e.self:SetAppearance(3);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
