function event_spawn(e)
	eq.set_timer("depop", 60 * 60 * 1000) -- 1hr depop
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_death_complete(e)
	eq.spawn2(200040,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end
