--An_Unimaginable_Horror (207031)

function event_spawn(e)
	eq.set_timer("depop",30*60*1000); --fail timer; 30 minutes
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_death_complete(e)
	eq.spawn2(207082,0,0,1,-1021,-27,0); --Real #Baraguj_Szuul
	local instance_id = eq.get_instance_id();
	local client_list = eq.get_entity_list():GetClientList();
	
	for client in client_list.entries do
		if client:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 200 then	--#distance restriction so the members need to be reasonably close.
			e.other:MovePCInstance(207,instance_id,1,-890,-27,180); --back to Baraguj_Szuul
		end
	end
end
