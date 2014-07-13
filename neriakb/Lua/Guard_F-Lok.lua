local count = 0;

function event_spawn(e)
	eq.set_timer("checks",125000);
end

function event_timer(e)
	count++;
	if((count == 1) and (e.self:GetZ()onetime > 800 or e.self:GetZ()onetime < 1999)) then
		eq.start(36);
	end
	if((count == 1) and (e.self:GetZ()onetime < 800 or e.self:GetZ()onetime > 1999)) then
		eq.stop;
		e.self:MoveTo(-630,-71,-24.75,162);
	end
	if(count ==2 ) then
		eq.set_timer("checks",125000);
		count = 0;
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
