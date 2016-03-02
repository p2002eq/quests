function event_combat(e)
	if (e.joined) then
		-- grab the entity list
		--local entity_list = eq.get_entity_list():GetMobByNpcTypeID(127108);
		
		local entity_list = eq.get_entity_list();
		local npc_table = {127108,127025,127031};
		for k,v in pairs(npc_table) do
			local npc = entity_list:GetMobByNpcTypeID(v);
					    e.self:Shout("test");
			if (npc.valid) then
					    e.self:Shout("testing2");
		        npc:Attack(e.other:GetName());
		            e.self:Shout("attacked");
				--npc:AddToHateList(e.other,1);
			end
		end
	end
end

