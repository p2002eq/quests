--Gindan_Flayer (214084)
--chance for mob to split into two at 60% health
--potactics

function event_combat(e)
	if e.joined then
		eq.set_next_hp_event(61);
	end
end

function event_hp(e)
	if e.hp_event == 61 and e.self:GetSpawnPointID() ~= 0 then
		local rand = math.random(1,100);
		if rand > 10 then
			for n = 1,2 do
				splitter = eq.spawn2(214084,0,0,e.self:GetX() + math.random(-5,5), e.self:GetY() + math.random(-5,5),e.self:GetZ(),e.self:GetHeading());	--Gindan_Flayer (214084)
				eq.set_timer("depop", 3 * 60 * 1000, splitter);
			end
			eq.depop_with_timer();
		end
	end
end

function event_timer(e)
	if e.timer == "depop" and not e.self:IsEngaged() then
		eq.depop();
	end
end

