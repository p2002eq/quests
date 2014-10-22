-- AngeloX
function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 35, e.self:GetX() + 35, e.self:GetY() - 35, e.self:GetY() + 35);
end

function event_enter(e)
	e.other:MovePC(84,1408.9,-4334.3,-103.6);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
