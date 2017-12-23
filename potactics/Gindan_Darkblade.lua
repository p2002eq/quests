function event_spawn(e)
	eq.set_next_hp_event(51);
end

function event_hp(e)
	if e.hp_event == 51 then
		eq.spawn2(214115,0,0,e.self:GetX()+10,e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(214115,0,0,e.self:GetX()-10,e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());
	end
end