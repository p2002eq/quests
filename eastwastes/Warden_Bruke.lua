--Warden Bruke
--zone: eastwastes

--script to call random # of guards on aggro

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
			local guard_roll = math.random(1,100);
			
			e.self:Say("GUARDS ASSIST ME!");
			if (guard_roll >= 60) then		-- 40% chance to spawn 4 guards
				g1 = eq.spawn2(116166, 0, 0, (x + 15), (y + 5), z, h);
				g2 = eq.spawn2(116166, 0, 0, (x - 15), (y + 5), z, h);
				g3 = eq.spawn2(116166, 0, 0, (x + 15), (y - 15), z, h);
				g4 = eq.spawn2(116166, 0, 0, (x - 15), (y - 15), z, h);
			elseif (guard_roll >= 30) then	-- 30% chance to spawn 3 guards
				g1 = eq.spawn2(116166, 0, 0, (x + 15), (y + 5), z, h);
				g2 = eq.spawn2(116166, 0, 0, (x - 15), (y + 5), z, h);
				g3 = eq.spawn2(116166, 0, 0, x, (y - 15), z, h):GetID();
			elseif (guard_roll >=10) then	--20% chance to spawn 2 guards
				g1 = eq.spawn2(116166, 0, 0, (x + 15), (y + 5), z, h);
				g2 = eq.spawn2(116166, 0, 0, (x - 15), (y + 5), z, h);
			else							--10% chance to spawn only 1 guard
				g1 = eq.spawn2(116166, 0, 0, (x + 15), (y + 5), z, h);
			end
			eq.set_timer("depop", 600000);
			cooldown = true;
		end
		
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