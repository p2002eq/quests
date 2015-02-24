function event_spawn(e)
	eq.set_proximity(e.self:GetX()-50,e.self:GetX()+50,e.self:GetY()-50,e.self:GetY()+50);
end

function event_enter(e)
	if((e.other:Class() == "Monk") and (e.other:GetLevel() > 45)) then
		-- Monk Epic 1.0
		eq.attack(" .. e.other:GetName() .. ");
	end
end

function event_death_complete(e)
	e.self:Shout("Grraaaagghhhh!! Not..Possible!");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
