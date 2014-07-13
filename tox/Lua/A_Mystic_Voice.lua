function event_spawn(e)
	eq.set_timer("tox5min",300000); --Live like is 900
end

function event_timer(e)
	if(e.timer == "tox5min") then
		eq.stop_timer("tox5min");
		e.self:Say("The portal to Luclin will become active in five minutes. Please begin gathering at the Spires if you wish to travel.");
		eq.set_timer("tox3min",120000);
	end
	if(e.timer == "tox3min") then
		eq.stop_timer("tox3min");
		e.self:Say("As a reminder, the portal will become active in three minutes.");
		eq.set_timer("tox2min",60000);
	end
	if(e.timer == "tox2min") then
		eq.stop_timer("tox2min");
		e.self:Say("Two minutes till teleportation. Please be prepared to step inside the circle of Spires.");
		eq.set_timer("tox1min",60000);
	end
	if(e.timer == "tox1min") then
		eq.stop_timer("tox1min");
		e.self:Say("One minute till teleportation. Please be prepared to step inside the circle of Spires.");
		eq.set_timer("toxtimer",60000);
	end
	if(e.timer == "toxtimer") then
		eq.stop_timer("toxtimer");
		e.self:Say("The portal to Luclin is about to become active. Please stand inside the circle of Spires and have a shard upon your person.");
		eq.set_global("nexus_tox",1,3,"S60"); --when the portal is open, global is set true for 1 min.
		eq.set_timer("tox5min",900000);
		eq.signal(38051,101,0); --triggers the flavor
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
