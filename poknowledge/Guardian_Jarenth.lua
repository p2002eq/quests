function event_spawn(e)
	x = e.self:GetX();
	y = e.self:GetY();
	eq.set_proximity(x - 90, x + 90, y - 90, y + 90);
end

function event_enter(e)
	eq.signal(202274,5); --Nomaad
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
