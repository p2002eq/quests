--#The_Protector_of_Dresolik (212063)
--solrotower

function event_spawn(e)
	eq.set_timer("depop", 30 * 60 * 1000);
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop", 30 * 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "depop" then
		if not e.self:IsEngaged() then
			eq.depop();
		else
			eq.stop_timer(e.timer);
			eq.set_timer("depop", 15 * 1000);
		end
	end
end

function event_death_complete(e)
	eq.spawn2(212066,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ() - 5, e.self:GetHeading());	--A_Planar_Projection (212066)
end