function event_spawn(e)
	e.self:ChangeSize(eq.ChooseRandom(7,11));	--pick random size
end

function event_signal(e)
	if e.signal == 1 then
		eq.depop();
	elseif e.signal == 2 then
		deyid = eq.get_entity_list():GetMobByNpcTypeID(204468);
		eq.move_to(deyid:GetX(),deyid:GetY(),deyid:GetZ(),-1);	--creep in on Deyid the Twisted
		eq.set_timer("move", 3 * 1000);
	end
end

function event_timer(e)
	if e.timer == "move" then
		eq.stop_timer(e.timer);
		eq.move_to(e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading(), true);	--added to stop previous move_to command
	end
end
