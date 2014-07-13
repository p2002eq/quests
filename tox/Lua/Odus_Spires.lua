function event_spawn(e)
	x = e.self:GetX();
	y = e.self:GetY();
	eq.set_proximity(x - 120, x + 120, y - 120, y + 120);
end

function event_enter(e)
	eq.set_global("spire_tox",1,1,"F"); --when we enter the spires, set global true.
	spire_tox = nil;
end

function event_exit(e)
	eq.delete_global("spire_tox"); --when we leave spires, set global false.
	spire_tox = nil;
end

function event_signal(e)
	if(e.signal == 101) then
		e.self:CastSpell(38051,2935); --flavor
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
