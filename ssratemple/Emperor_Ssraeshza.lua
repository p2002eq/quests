-- Emperor Ssraeshza (162504) in Ssratemple

-- guards:      Heriz,  Yasiz, Zlakas, Nilasz,  Skzik,  Grziz, Slakiz, Klazaz
guard_list = { 162123, 162124, 162125, 162126, 162127, 162128, 162129, 162130 };

-- note that fake blood's 1 hour respawn time functions as a de facto 1-hour time limit on this event
function event_spawn(e)
	deactivate(e.self);
end

function event_timer(e)
	if e.timer == 'activate' then
		activate(e.self);
	elseif e.timer == 'aggro_guards' then
		aggro_guards(e.self:GetHateTop());
	end
end

function event_death_complete(e)
	e.self:Emote("'s corpse says 'How...did...ugh...'");
	eq.spawn2(162491, 0, 0, 904, -269, 405, 190);
	eq.spawn2(162491, 0, 0, 860, -296, 405, 190);
	eq.spawn2(162491, 0, 0, 805, -297, 405, 190);
	eq.spawn2(162491, 0, 0, 799, -333, 405, 190);
	eq.spawn2(162491, 0, 0, 828, -381, 405, 190);
	eq.spawn2(162491, 0, 0, 908, -384, 405, 190);
	eq.stop_timer('aggro_guards');
end

function event_slay(e)
	e.self:Say('Your god has found you lacking.');
end

function event_combat(e)
	-- during combat, reaggro the guards on current target every 30 seconds (ensures no idle guards)
	if e.joined then
		aggro_guards(e.self:GetHateTop());
		eq.set_timer('aggro_guards', 30 * 1000);
	else
		eq.stop_timer('aggro_guards');
	end
end

function event_signal(e)
	
	if e.signal == 10 then  -- deactivation signal
		deactivate(e.self);
		e.self:WipeHateList();
	
	elseif e.signal == 99 then  -- activation signal
		eq.set_timer('activate', math.random(180, 300) * 1000);
	end
end

function aggro_guards(mob)
	for _, guard in pairs(guard_list) do
		local guard_mob = eq.get_entity_list():GetNPCByNPCTypeID(guard);
		if guard_mob ~= nil then
			guard_mob:AddToHateList(mob);
		end
	end
end

function deactivate(mob)
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);
end

function activate(mob)
	mob:SetBodyType(7, true);
	mob:SetSpecialAbility(24, 0);
end

-- Event by Kalaylus
