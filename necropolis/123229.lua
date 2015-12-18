--Vaniki shadowmen
--Used for the Vaniki Cycle

function event_spawn(e)
	local randomNamed = math.random(1, 10);
	local entity_list = eq.get_entity_list();	
	eq.set_timer("depop", 7320000); -- 122 hours
	
	if (randomNamed == 1) then --10% chance
		if (entity_list:IsMobSpawnedByNpcTypeID(123250 == false)) then --Is vaniki up?
			eq.unique_spawn(123250, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); --Vaniki	
			eq.depop_with_timer();
		end
	elseif (randomNamed > 1) and (randomNamed < 5) then -- 1 < x < 5
		if (entity_list:IsMobSpawnedByNpcTypeID(123246 == false)) then --Is Dominator Yisaki up?
			eq.unique_spawn(123246, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
			eq.depop_with_timer();
		end
	elseif (randomNamed > 4) and (randomNamed < 8) then -- 4 < x < 8 
		if (entity_list:IsMobSpawnedByNpcTypeID(123251) == false) then --Is Warmaster Utvara up?
			eq.unique_spawn(123251, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
			eq.depop_with_timer();
		end	
	else --  x > 7
		if (entity_list:IsMobSpawnedByNpcType(123249)) then --Is seeker Bulvara up
			eq.unique_spawn(123249, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		end
	end
		

end

function event_timer(e)

	if (e.timer == "depop") then
		eq.depop_with_timer();
	end

end
