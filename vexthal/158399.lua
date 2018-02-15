--Akhevan Warder Script
--zone: vexthal

function event_combat(e)
	if e.joined then
		eq.set_timer("monitor",1);
	else
		eq.stop_timer("monitor");
	end
end

function event_timer(e)
	if e.timer == "monitor" and e.self:IsEngaged() then
		BanishCheck(e);
	end
end

function BanishCheck(e)
    local instance_id = eq.get_zone_instance_id();
	local zone_id = eq.get_zone_id();
	local x,y,z = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	
	local client_list = eq.get_entity_list():GetClientList();
	
	if client_list ~= nil then
		for client in client_list.entries do
			local qglobals = eq.get_qglobals(client);
			if client:CalculateDistance(x,y,z) <= 100 and e.self:CheckLoS(client) and not client:GetGM() then
				eq.target_global("vt_banished", "1", "D30", 0, client:CharacterID(), 158);	--exploiter/dumbass tracker
				client:MovePCInstance(zone_id, instance_id, 596,0,5,128);	--Outside Blob 1's room
				client:Message(7,"Shadows gather about your body and transport you.")
				e.self:WipeHateList();
			end
		end
	end
end
	