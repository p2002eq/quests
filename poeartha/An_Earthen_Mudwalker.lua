--An_Earthen_Mudwalker (218317)
--Mud Ring Event Trigger
--poeartha

function event_death_complete(e)	
	local spawnpoint_list = {366737,365808,367097,366840};	--4 spawns at top of temple

	for k,spawn_id in pairs(spawnpoint_list) do 
		if e.self:GetSpawnPointID() == spawn_id then
			eq.signal(218392,1);	--#mud_controller (218392)
		end
	end
	
end
