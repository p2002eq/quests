function event_combat(e)
	if e.joined then
		eq.set_timer("adds", 30 * 1000);
	else
		eq.stop_timer("adds");
	end
end

function event_timer(e)
	if e.timer == "adds" then		
		ran = math.random(1,5);
		if( ran == 1) then
			eq.spawn2(212067, 0, 0,  e.self:GetX(),  e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());	--212067 - an_efreeti_makin
		elseif ( ran == 2) then
			eq.spawn2(212068, 0, 0,  e.self:GetX(),  e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());	--212068 - an_efreeti_adeel
		elseif ( ran == 3) then
			eq.spawn2(212069, 0, 0,  e.self:GetX(),  e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());	--212069 - an_efreeti_jiri
		elseif ( ran == 4) then
			eq.spawn2(212070, 0, 0,  e.self:GetX(),  e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());	--212070 - an_efreeti_seif
		elseif ( ran == 5) then
			eq.spawn2(212071, 0, 0,  e.self:GetX(),  e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());	--212071 - an_efreeti_nabil
		end
	end
end

function event_death_complete(e)
	eq.spawn2(202365,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
end