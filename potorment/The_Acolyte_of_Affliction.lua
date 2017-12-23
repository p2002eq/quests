function event_spawn(e)
	eq.set_next_hp_event(80);
end

function event_hp(e)

	if e.hp_event == 80 then
		eq.spawn2(207068,0,0,(e.self:GetX()+5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207068,0,0,(e.self:GetX()-5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207068,0,0,(e.self:GetX()+5),(e.self:GetY()+5),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207068,0,0,(e.self:GetX()+5),(e.self:GetY()-5),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207068,0,0,(e.self:GetX()-5),(e.self:GetY()+5),e.self:GetZ(),e.self:GetHeading());
		eq.set_next_hp_event(40);
		eq.set_next_inc_hp_event(98);
	end

	if e.hp_event == 40 then
		eq.spawn2(207068,0,0,(e.self:GetX()+5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207068,0,0,(e.self:GetX()-5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207068,0,0,(e.self:GetX()+5),(e.self:GetY()+5),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207068,0,0,(e.self:GetX()+5),(e.self:GetY()-5),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207068,0,0,(e.self:GetX()-5),(e.self:GetY()+5),e.self:GetZ(),e.self:GetHeading());
	end

	if e.inc_hp_event == 98 then
		eq.set_next_hp_event(80);
	end
end