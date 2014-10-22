function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 65, e.self:GetX() + 65, e.self:GetY() - 65, e.self:GetY() + 65);
end

function event_enter(e)
	e.other:MovePC(93,2736.0,3438.8,-158.6);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- AngeloX
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
