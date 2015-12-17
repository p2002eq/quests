--Vaniki shadowmen

function event_spawn(e)
	local vanikiSpawn = math.random(1, 10);
	local entity_list = eq.get_entity_list();	
	eq.set_timer("depop", 7320000); -- 122 hours
	
	if (vanikiSpawn == 1) then --10% chance
		if (entity_list:IsMobSpawnedByNpcTypeID(123250 == false)) then --Is vaniki up?
			eq.unique_spawn(123250, 0, 0, e.self:GetX(); e.self:GetY(), e.self:GetZ();, e.self:GetHeading()); --Vaniki	
			eq.depop_with_timer();
		end
	end

end

function event_timer(e)

	if (e.timer == "depop") then
		eq.depop_with_timer();
	end

end
