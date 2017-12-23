function event_combat(e)
	local instance_id = eq.get_instance_id();
	local clientlist = eq.get_entity_list():GetClientList();
	for client in client.list do
		if client:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 100 then
			e.other:MovePCInstance(207,instance_id,-1094,910,-746,0);
		end
	end
	eq.signal(207071); --signal mouth_trigger that spawns all the mobs in stomach
	eq.set_timer("depop", 5 * 1000);
end

function event_timer(e)
	eq.depop_with_timer()
end