function event_spawn(e)
	eq.set_timer("depop", 60 * 60 * 1000);
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop_all(208001);
		eq.depop();
	end
end

function event_slay(e)
	eq.spawn2(208001,0,0,(e.self:GetX() + 7),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(208001,0,0,(e.self:GetX() - 7),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(208001,0,0,e.self:GetX(),(e.self:GetY() + 7),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(208001,0,0,e.self:GetX(),(e.self:GetY() - 7),e.self:GetZ(),e.self:GetHeading());
end

function event_death_complete(e)
	eq.depopall(208001);
	eq.spawn2(200039,0,0,180,230,-71.5,127);
end
