function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the Kartis district of [New Tanaan]. comrade.  May you gain power through knowledge.");
	end
end
function event_spawn(e)
	x = e.self:GetX();
	y = e.self:GetY();
	eq.set_proximity(x - 90, x + 90, y - 90, y + 90);
end

function event_enter(e)
	eq.signal(202273,5); --Qadar
	eq.signal(202274,5); --Nomaad
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
