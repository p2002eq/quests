--ring five encounter

local spawnOracles = math.random(1, 3);
local spawnInvaders = math.random(1, 3);

function event_encounter_load(e)
	--locs made up
	eq.spawn2(116600, 0, 0, -650, -2744, 180, 45); --Scarbrow

	if (spawnInvaders == 3) then
		eq.spawn2(116586, 0, 0, -654, -2723, 180, 45); --Invader
		eq.spawn2(116586, 0, 0, -643, -2768, 180, 45); --Invader
		eq.spawn2(116586, 0, 0, -633, -2758, 180, 45); --Invader
	else --spawnInvaders == 1 or 2
		eq.spawn2(116586, 0, 0, -654, -2723, 180, 45); --Invader
		eq.spawn2(116586, 0, 0, -643, -2768, 180, 45); --Invader
	end
	
	if (spawnOracles == 3) then	
		eq.spawn2(116587, 0, 0, -681, -2739, 180, 45); --Oracle
		eq.spawn2(116587, 0, 0, -673, -2766, 180, 45); --Oracle
		eq.spawn2(116587, 0, 0, -673, -2766, 180, 45); --Oracle
	else
		eq.spawn2(116587, 0, 0, -681, -2739, 180, 45); --Oracle
		eq.spawn2(116587, 0, 0, -673, -2766, 180, 45); --Oracle
	end
	
	--spawned 
end
