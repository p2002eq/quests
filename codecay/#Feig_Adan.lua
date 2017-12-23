function event_spawn(e)
	eq.spawn2(200042,0,0,(e.self:GetX() + 10),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(200042,0,0,(e.self:GetX() + 10),(e.self:GetY() + 10),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(200042,0,0,(e.self:GetX() - 10),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(200042,0,0,(e.self:GetX() - 10),(e.self:GetY() - 10),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(200043,0,0,e.self:GetX(),(e.self:GetY() - 10),e.self:GetZ(),e.self:GetHeading());
end

function event_death_complete(e)
	eq.spawn2(200046,0,0,0,-280,-244,0); --south room
end

function event_signal(e)
	eq.depop();
end

