--a_Fledgling_War_Boar (214040)
--potactics

function event_signal(e)
	if e.signal == 1 then
		eq.spawn2(214311,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	--#an_Enraged_War_Boar (214311)
		eq.depop_with_timer();
	end
end