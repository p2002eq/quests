function event_spawn(e)
	
	x = e.self:GetX();
	y = e.self:GetY();
	eq.set_proximity(x - 5, x + 5, y - 5, y + 5);
end

function event_enter(e)
	
	e.other:MovePC(31,-485,-476,73);
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
