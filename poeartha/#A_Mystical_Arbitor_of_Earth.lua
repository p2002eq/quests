--#A_Mystical_Arbitor_of_Earth (218363)
--poeartha

function event_spawn(e)
	eq.set_timer("depop", 50 * 60 * 1000);	
	e.self:CameraEffect(3000,6);	--flavor (3 sec earthquake)
	eq.zone_emote(7,"Tremors spread throughout the Earthen Badlands making it difficult to keep your footing. A mystical voice echoes in your mind, 'Turn back now mortals!  You have no business seeking the council of the twelve.'");
end

function event_combat(e)
	if e.joined then
		eq.set_timer("memblur",12 * 1000);
	end
end

function event_timer(e)
	if e.timer == "memblur"  then
		if eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(),50) then	--check if player is within 50 units
			if math.random(100) <= 30 then e.self:WipeHateList() end  	--30% memblur chance
		elseif not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
		end
	elseif e.timer == "depop" then
		eq.depop();
	end
end

function event_death_complete(e)
	eq.spawn2(218367,0,0,1530,-2745,9,392);	--#A_Planar_Projection (218367)
end

