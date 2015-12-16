--ring five encounter

local spawnOracles = math.random(1, 3);
local spawnInvaders = math.random(1, 3);

function event_encounter_load(e)
	--locs made up
	scarid1 = eq.spawn2(116600, 0, 0, -650, -2744, 180, 45); --Scarbrow

	if (spawnInvaders == 3) then
		invid1 = eq.spawn2(116586, 0, 0, -654, -2723, 180, 45); --Invader
		invid2 = eq.spawn2(116586, 0, 0, -643, -2768, 180, 45); --Invader
		invid3 = eq.spawn2(116586, 0, 0, -633, -2758, 180, 45); --Invader
	else --spawnInvaders == 1 or 2
		invid1 = eq.spawn2(116586, 0, 0, -654, -2723, 180, 45); --Invader
		invid2 = eq.spawn2(116586, 0, 0, -643, -2768, 180, 45); --Invader
	end
	
	if (spawnOracles == 3) then	
		orcid1 = eq.spawn2(116587, 0, 0, -681, -2739, 180, 45); --Oracle
		orcid2 = eq.spawn2(116587, 0, 0, -673, -2766, 180, 45); --Oracle
		orcid3 = eq.spawn2(116587, 0, 0, -673, -2766, 180, 45); --Oracle
	else
		orcid1 = eq.spawn2(116587, 0, 0, -681, -2739, 180, 45); --Oracle
		orcid2 = eq.spawn2(116587, 0, 0, -673, -2766, 180, 45); --Oracle
	end
	
	--spawned 
	eq.set_timer("move", 10); --10 seconds
end

function event_timer(e)
	if (e.timer == "move") then
		scarid1:CastToNPC():SafeGuardSpot(0);	
		scarid1:MoveTo(-369, -2628, 180);
		if (spawnOracles == 3) then
			
		end
	end

end
