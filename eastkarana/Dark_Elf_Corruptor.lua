function event_spawn(e)
	eq.set_timer("despawn",300000);
end

function event_timer(e)
	eq.stop_timer("despawn");
	eq.depop();
end

function event_death_complete(e)
	eq.stop_timer("despawn");
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
