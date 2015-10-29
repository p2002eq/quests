function event_combat(e)
	if (e.joined) then
		-- grab the entity list
		local entity_list = eq.get_entity_list();
		-- 
		local npc_table = {127027,127028,127103,127057,127102,127026};
		for k,v in pairs(npc_table) do
			local npc = entity_list:GetMobByNpcTypeID(v);
			if (npc.valid) then
				npc:AddToHateList(e.other,1);
			end
		end
	end
end

