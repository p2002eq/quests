function event_spawn(e)
	x = e.self:GetX();
	y = e.self:GetY();
	eq.set_proximity(x - 20, x + 20, y - 20, y + 20);
end

function event_enter(e)
	local qglobals = eq.get_qglobals(e.other);
	eq.set_global("nexus_fay","1",5,"M10"); --when we enter the spires, set global true.
	qglobals.nexus_fay = nil;
end

function event_exit(e)
	local qglobals = eq.get_qglobals(e.other);
	eq.delete_global("nexus_fay"); --when we leave spires, set global false.
	qglobals.nexus_fay = nil;
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
