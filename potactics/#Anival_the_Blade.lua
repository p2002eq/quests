--#Anival_the_Blade (214033)
--mob to splits into two at 60% health
--potactics

function event_combat(e)
	if e.joined then
		eq.set_next_hp_event(61);
	end
end

function event_hp(e)
	if e.hp_event == 61 and e.self:GetSpawnPointID() ~= 0 then
		splitter1 = eq.spawn2(214033,0,0,e.self:GetX() + math.random(-5,5), e.self:GetY() + math.random(-5,5),e.self:GetZ(),e.self:GetHeading());	--#Anival_the_Blade (214033)
		splitter2 = eq.spawn2(214288,0,0,e.self:GetX() + math.random(-5,5), e.self:GetY() + math.random(-5,5),e.self:GetZ(),e.self:GetHeading());	--Anival_the_Blade (214288)
		eq.set_timer("depop", 3 * 60 * 1000, splitter1);
		eq.set_timer("depop", 3 * 60 * 1000, splitter2);
		eq.depop_with_timer();
	end
end

function event_timer(e)
	if e.timer == "depop" and not e.self:IsEngaged() then
		eq.depop();
	end
end

