function event_spawn(e)
	eq.set_timer("depop",600000);
end

function event_timer(e)
	eq.depop();
end

function event_death_complete(e)
	eq.spawn2(69142,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------