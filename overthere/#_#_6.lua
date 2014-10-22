-- Zone to Timorous event
function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 75, e.self:GetX() + 75, e.self:GetY() - 75, e.self:GetY() + 75);
end

function event_enter(e)
	e.other:MovePC(96,3506.0,5702.5,4.6);
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
