function event_combat(e)
	if (e.joined) then
	    e.self:Shout("this is a test");
		-- grab the entity list
		local entity_list = eq.get_entity_list();
		e.self:Shout("test2");
		local npc_table = {127108,127025,127031};
		e.self:Shout("test3");
		for k,v in pairs(npc_table) do
		    e.self:Shout("testing");
			local npc = entity_list:GetMobByNpcTypeID(v);
			if (npc.valid) then
				npc:AddToHateList(e.other,1);
			end
		end
	end
end

