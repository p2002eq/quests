--Sorrowsong (207052)
--Plane of Torment

function event_waypoint_arrive(e)
	if e.wp < 3 then
		e.self:CastSpell(3011,e.self:GetID());	--cast Sorrow Song
	end
end



function event_signal(e)
	if e.signal == 1 then
		eq.start(1);	--start pathing on grid 1
		e.self:CastSpell(3011,e.self:GetID());	--cast Sorrow Song initially
	elseif e.signal == 2 then
		eq.stop();
		activate(e.self);
		saryrn = eq.get_entity_list():GetMobByNpcTypeID(207001);	--Saryrn (207001)
		e.self:GMMove(saryrn:GetX() + math.random(-10,10), saryrn:GetY() + math.random(-10,10), saryrn:GetZ(), 0);	--Move to Saryrn's Side
		e.self:AddToHateList(saryrn:GetHateTop(),1);
	end
end

function activate(mob)
	mob:SetBodyType(21, true);		--animal
	mob:SetSpecialAbility(24, 0);	--enable aggro on players
	mob:SetSpecialAbility(35, 0);	--allow harm from players
end
