--A_celestial_portal (209102)
--Emmerik_Skyfury Event
--zone: bothunder

function event_signal(e)
	if e.signal == 1 then
		boss = eq.get_entity_list():GetMobByNpcTypeID(209053);	--Emmerik_Skyfury (209053)
		storm = eq.spawn2(209156,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());	--An_animated_meteor (209156)
		storm:CastToNPC():MoveTo(boss:GetX() + math.random(-20,20), boss:GetY() + math.random(-20,20), boss:GetZ(),boss:GetHeading(),true);
		eq.set_timer("depop", 5 * 60 * 1000, storm);
	end
end
