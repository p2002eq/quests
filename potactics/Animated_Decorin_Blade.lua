--Five Animated Decorin Blades spawn when Tagrin Maldric is aggro'd. This quest file will depop them if they aren't aggro'd for fifteen minutes after spawning.

function event_spawn(e)
	x = e.self:GetX();
	y = e.self:GetY();
	z = e.self:GetZ();
	h = e.self:GetHeading();
	eq.set_timer("depop",15*60*1000);
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop", 15 * 60 * 1000);
	end
end

function event_death_complete(e)
	eq.stop_timer("depop");
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(214054) then
		eq.spawn2(214119,0,0,x,y,z,h);
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.stop_timer(e.timer);
		eq.depop();
	end
end
