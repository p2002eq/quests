--a_pristine_recluse (215044)
--Sigismond_Windwalker Event Trigger
--poair

function event_death_complete(e)	
	local spawnpoint_list = {366142, 366079, 366392, 366471, 366673, 366772, 366814,366826, 367199, 367344, 367476, 365476, 365511, 365533,366023, 366752, 366761, 365366, 365611, 365661, 365778,365370, 365791, 365869, 365917, 365980, 366156, 367200, 365694, 365768, 365770,365781, 366466, 366538, 366934, 367087, 367172, 365373};

	for k,spawn_id in pairs(spawnpoint_list) do 
		if e.self:GetSpawnPointID() == spawn_id then
			eq.signal(215428,1);	--#isle_five_controller (215428)
		end
	end
	
end
