function event_signal(e)
	-- signal from Broodmother to walk out to front of fort to meet her.
	if(e.signal == 1) then
		eq.start(137);
	-- signal from Broodmother to repop as quest version and run!
	elseif (e.signal == 2) then
		eq.depop_with_timer();
		eq.spawn2(118333,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
end
