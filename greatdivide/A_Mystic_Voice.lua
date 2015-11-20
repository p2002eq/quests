function event_spawn(e)
	eq.set_timer("gdivide15min",600000); -- Live like is 15 minutes
end

function event_timer(e)
	if(e.timer == "gdivide15min") then
		eq.stop_timer("gdivide15min");
		e.self:Say("The portal to Luclin will become active in five minutes. Please begin gathering at the Spires if you wish to travel.");
		eq.set_timer("gdivide5min",120000);
	elseif(e.timer == "gdivide5min") then
		eq.stop_timer("gdivide5min");
		e.self:Say("As a reminder, the portal will become active in three minutes.");
		eq.set_timer("gdivide3min",60000);
	elseif(e.timer == "gdivide3min") then
		eq.stop_timer("gdivide3min");
		e.self:Say("Two minutes till teleportation. Please be prepared to step inside the circle of Spires.");
		eq.set_timer("gdivide2min",60000);
	elseif(e.timer == "gdivide2min") then
		eq.stop_timer("gdivide2min");
		e.self:Say("One minute till teleportation. Please be prepared to step inside the circle of Spires.");
		eq.set_timer("gdivide1min",60000);		
	elseif(e.timer == "gdivide1min") then
		eq.stop_timer("gdivide1min");
		e.self:Say("The portal to Luclin is about to become active. Please stand inside the circle of Spires and have a shard upon your person.");
		eq.set_global("nexus_gd","1",3,"S60"); -- when the portal is open, global is set true for 1 min.
		eq.set_timer("gdivide15min",600000);
		eq.signal(118314,101); -- triggers the flavor
	end
end