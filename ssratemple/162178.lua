-- #Rhag`Zhezum (162178) for Rhag cycle AKA Rhag 1

function event_spawn(e)
	eq.delete_global("AL_Cycle");	--reset qglobal trigger
	eq.depop(162192);  			--depop Rhag`Mozdezh if up
	eq.depop(162193);			--depop Rhag 2 guard
	eq.depop(162194);			--depop Rhag 2 guard
	eq.depop(162195);			--depop Rhag 2 guard
	eq.depop(162196);			--depop Rhag 2 guard
	eq.depop(162517);  			--depop Arch Lich if up
	eq.depop(162518); 			--depop AL Guard
	eq.depop(162519); 			--depop AL Guard
	eq.depop(162090); 			--depop AL Guard
	eq.depop(162090); 			--depop AL Guard
end

function event_death_complete(e)
	eq.unique_spawn(162192, 0, 0, 644, -280, 146, 196); -- spawn Rhag`Mozdezh
	eq.spawn2(162193, 0, 0, 561, -235, 138, 128);  -- guard
	eq.spawn2(162194, 0, 0, 660, -309, 146, 218);  -- guard
	eq.spawn2(162195, 0, 0, 660, -246, 146, 165);  -- guard
	eq.spawn2(162196, 0, 0, 561, -323, 138, 0);  -- guard
	eq.set_global("AL_Cycle","R2",3,"D4");  --sets global to "R2" to flag Rhag`Mozdezh as next target in cycle in case of zone crash/reboot
end
