-- #Rhag`Zhezum (162178) for Rhag cycle AKA Rhag 1

function event_death_complete(e)
	eq.unique_spawn(162192, 0, 0, 644, -280, 146, 196); -- spawn Rhag 2
	eq.spawn2(162193, 0, 0, 561, -235, 138, 128);  -- guard
	eq.spawn2(162194, 0, 0, 660, -309, 146, 218);  -- guard
	eq.spawn2(162195, 0, 0, 660, -246, 146, 165);  -- guard
	eq.spawn2(162196, 0, 0, 561, -323, 138, 0);  -- guard
end
