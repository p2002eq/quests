function event_spawn(e)
	cooldown = false;
end

function event_hate_list(e)
	if e.joined then
		if not cooldown and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(116166) then
			local x = e.self:GetX();
			local y = e.self:GetY();
			local z = e.self:GetZ();
			local h = e.self:GetHeading();
			
			g1 = eq.spawn2(116166, 0, 0, (x + 15), (y + 5), z, h):GetID();
			g2 = eq.spawn2(116166, 0, 0, (x - 15), (y + 5), z, h):GetID();
			g3 = eq.spawn2(116166, 0, 0, x, (y - 15), z, h):GetID();
			eq.set_timer("depop", 600000);
			cooldown = true;
		end
		
		eq.get_entity_list():GetMob(g1):AddToHateList(e.other, 1);
		eq.get_entity_list():GetMob(g2):AddToHateList(e.other, 1);
		eq.get_entity_list():GetMob(g3):AddToHateList(e.other, 1);
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.stop_timer("depop");
		eq.depop_all(116166);
		cooldown = false;
	end
end

function event_death_complete(e)
	eq.depop_all(116166);
end