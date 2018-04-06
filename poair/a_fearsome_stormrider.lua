--a_fearsome_stormrider (215014)
--Stormrider Event Trigger
--poair

function event_death_complete(e)	
	local spawnpoint_list = {365275, 365420, 365508, 365676, 366294, 366543, 366662, 366887, 367241, 367375, 367524, 365827, 365989, 366073, 367211, 365467, 365822, 366161, 366502, 365410, 367084, 367463, 365916, 366133, 366565, 367103, 366140};

	for k,spawn_id in pairs(spawnpoint_list) do 
		if e.self:GetSpawnPointID() == spawn_id then
			eq.signal(215425,1);	--#isle_two_controller (215425)
		end
	end
	
end
