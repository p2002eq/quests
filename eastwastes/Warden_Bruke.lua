local cooldown = false;

function event_spawn(e)
	eq.depop_all(116166);
end

function event_combat(e)
	eq.zone_emote(1, "combat_change");
	if e.joined and not cooldown and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(116166) then
		eq.zone_emote(1, "aggro");
		local x = e.self:GetX();
		local y = e.self:GetY();
		local z = e.self:GetZ();
		local h = e.self:GetHeading();
		
		eq.spawn2(116166, 0, 0, (x + 15), (y + 5), z, h);
		eq.spawn2(116166, 0, 0, (x - 15), (y + 5), z, h);
		eq.spawn2(116166, 0, 0, x, (y - 15), z, h);
		eq.start_timer("depop", 6000);
		cooldown = true;
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.stop_timer("depop");
		eq.depop_all(116166);
		cooldown = false;
	end
end