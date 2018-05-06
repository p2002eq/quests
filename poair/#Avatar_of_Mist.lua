--#Avatar_of_Mist (215405)
--Triggered by Isle #4 Melernil_Faal`Armanna Event
--poair

function event_spawn(e)
	eq.set_timer("depop", 45 * 60 * 1000);	--45 min depop
end

function event_combat(e)
	if e.joined then
		eq.set_timer("memblur",12 * 1000);
	end
end

function event_timer(e)
	if e.timer == "depop" then
		SetGlobal();	--this is a blowable spawn.  Setting the global even if failure
		eq.depop();
	elseif e.timer == "memblur" then
		if eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(),50) then	--check if player is within 50 units
			if math.random(100) <= 40 then e.self:WipeHateList() end  	--40% memblur chance
		elseif not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
		end
	end
end

function event_death_complete(e)	
	SetGlobal();
end

function SetGlobal()
	local instance_id = eq.get_zone_instance_id();
	eq.set_global(instance_id .. "_AoMist_PoAir", "1",3,"D3");  
end

