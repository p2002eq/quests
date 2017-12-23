function event_spawn(e)
	eq.spawn2(200042,0,0,(e.self:GetX()+10),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(200042,0,0,(e.self:GetX()+10),(e.self:GetY()+5),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(200042,0,0,(e.self:GetX()+10),(e.self:GetY()-10),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(200042,0,0,(e.self:GetX()-10),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(200043,0,0,e.self:GetX(),(e.self:GetY()+10),e.self:GetZ(),e.self:GetHeading());
end

function event_death_complete(e)
	eq.spawn2(200054,0,0,200,1,-274,0);
end

function event_signal(e)
	eq.depop();
end
