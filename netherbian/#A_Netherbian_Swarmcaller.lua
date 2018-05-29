--#A_Netherbian_Swarmcaller (161066)
--chance to trigger The_Swarm_Leader (161095)
--netherbian

function event_death_complete(e)
	if math.random(100) <= 20 then	--20% chance to trigger
		local spawn_locs = {	[1] = {-408,406,5,261}, 
								[2] = {-275,445,5,128},
								[3] = {-402,638,5,261} };
		loc = math.random(1,3);
		eq.unique_spawn(161095,0,0,unpack(spawn_locs[loc]));	--The_Swarm_Leader (161095)
	end
end