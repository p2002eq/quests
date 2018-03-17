--Warden Bruke
--zone: eastwastes

--script to call random # of guards on aggro

function event_spawn(e)
	eq.signal(116595,1);				-- signals Kromrif Guards to depop
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("depop");		--Halt despawn timer on guards if combat is entered
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(116595) then
			e.self:Say("GUARDS, ASSIST ME !");
			
			local guard_roll = math.random(1,100);
			if (guard_roll >= 60) then		-- 40% chance to spawn 4 guards
				g1 = eq.spawn2(116595, 0, 0, -380, 430, -7, 504);
				g2 = eq.spawn2(116595, 0, 0, -360, 430, -7, 504);
				g3 = eq.spawn2(116595, 0, 0, -400, 430, -7, 504);
				g4 = eq.spawn2(116595, 0, 0, -340, 430, -7, 504);
			elseif (guard_roll >= 30) then	-- 30% chance to spawn 3 guards
				g1 = eq.spawn2(116595, 0, 0, -370, 430, -7, 504);
				g2 = eq.spawn2(116595, 0, 0, -390, 430, -7, 504);
				g3 = eq.spawn2(116595, 0, 0, -350, 430, -7, 504);
			elseif (guard_roll >=10) then	--20% chance to spawn 2 guards
				g1 = eq.spawn2(116595, 0, 0, -380, 430, -7, 504);
				g2 = eq.spawn2(116595, 0, 0, -360, 430, -7, 504);
			else							--10% chance to spawn only 1 guard]]
				g1 = eq.spawn2(116595, 0, 0, -370, 430, -7, 504);
			end
		end

	else
		eq.set_timer("depop",6*60*1000);  -- 6 min despawn on guards triggered on leaving combat
	end
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.stop_timer("depop");
		eq.signal(116595,1);			-- signals Kromrif Guards to depop
	end
end

function event_death_complete(e)
	eq.signal(116595,1);				-- signals Kromrif Guards to depop
end
