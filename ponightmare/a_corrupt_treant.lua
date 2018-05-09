local deyid;

function event_spawn(e)
	e.self:ChangeSize(eq.ChooseRandom(7,11));	--pick random size
	deyid = eq.get_entity_list():GetMobByNpcTypeID(204468);
	deactivate(e.self);
end

function event_signal(e)
	if e.signal == 1 then
		eq.set_timer("depop",60 * 1000);
	elseif e.signal == 2 then
		eq.move_to(deyid:GetX(),deyid:GetY(),deyid:GetZ(),-1);	--creep in on Deyid the Twisted
		eq.set_timer("move", 3 * 1000);
	elseif e.signal == 3 then
		activate(e.self);
		deyid = eq.get_entity_list():GetMobByNpcTypeID(204468);
		e.self:AddToHateList(deyid:GetHateRandom(),1);
	end
end

function event_timer(e)
	if e.timer == "move" then
		eq.stop_timer(e.timer);
		eq.move_to(e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading(), true);		--added to stop previous move_to command
	elseif e.timer == "depop" and not e.self:IsEngaged() then
		eq.depop();
	end
end


function deactivate(mob)
	mob:SetBodyType(11, true);	--no target
	mob:SetSpecialAbility(24, 1);	
	mob:WipeHateList();
end

function activate(mob)
	mob:SetBodyType(25, true);	--plant
	mob:SetSpecialAbility(24, 0);	
end
