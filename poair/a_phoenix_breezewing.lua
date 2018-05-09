--a_phoenix_breezewing (215058)
--Melernil_Faal`Armanna Event Trigger
--poair

function event_death_complete(e)	
	local spawnpoint_list = {365275, 365420, 365508, 365676, 366294, 366543, 366662, 366887, 367241, 367375, 367524, 365827, 365989, 366073, 367211, 365467, 365822, 366161, 366502, 365410, 367084, 367463, 365916, 366133, 366565, 367103, 366140};

	for k,spawn_id in pairs(spawnpoint_list) do 
		if e.self:GetSpawnPointID() == spawn_id then
			eq.signal(215427,1);	--#isle_four_controller (215427)
		end
	end
	
	--spawn 2 a_phoenix_gustlet on death
	for n = 1,2 do
		mob = eq.spawn2(215386,0,0,e.self:GetX() + math.random (-5,5), e.self:GetY() + math.random(-5,5), e.self:GetZ(), e.self:GetHeading());	--#a_phoenix_gustlet (215386)	
		eq.set_timer("depop", 15 * 60 * 1000, mob);
	end
end
