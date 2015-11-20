function call_zone_to_assist50(e_other)
	if (e.joined) then
		-- grab the entity list
		local entity_list = eq.get_entity_list();
		-- 
		local npc_table = {127053,127054};
		for k,v in pairs(npc_table) do
			local npc = entity_list:GetMobByNpcTypeID(v);
			if (npc.valid) then
				npc:AddToHateList(e.other,1);
			end
		end
	end
end

function call_zone_to_assist20(e_other)
	if (e.joined) then
		-- grab the entity list
		local entity_list = eq.get_entity_list();
		-- 
		local npc_table = {127055,127056,127061};
		for k,v in pairs(npc_table) do
			local npc = entity_list:GetMobByNpcTypeID(v);
			if (npc.valid) then
				npc:AddToHateList(e.other,1);
			end
		end
	end
	
end

function event_spawn(e)
	eq.set_next_hp_event(50);
end

function event_hp(e)
	
	if (e.hp_event == 50) then
		call_zone_to_assist50(e.other);
		eq.set_next_hp_event(20);
	elseif (e.hp_event == 20) then
		call_zone_to_assist20(e.other);
		
	end
end