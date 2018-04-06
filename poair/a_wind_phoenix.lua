--a_wind_phoenix (215026)
--Melernil_Faal`Armanna Event Trigger
--poair

function event_death_complete(e)	
	local spawnpoint_list = {365361, 365877, 365962, 366345, 366581, 366599, 366641, 366886, 367294, 367348, 367438, 367538, 366509, 366899, 367065, 365270, 365682, 365957, 366313, 367373};

	for k,spawn_id in pairs(spawnpoint_list) do 
		if e.self:GetSpawnPointID() == spawn_id then
			eq.signal(215427,1);	--#isle_four_controller (215427)
		end
	end
	
end
