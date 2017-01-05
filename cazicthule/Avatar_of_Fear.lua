-- Avatar of Fear for Ring of Fear in CT

-- Amy, TT, spider, Gorgon, gorilla
mobs = { 48390, 48392, 48354, 48382, 48383 }

function event_spawn(e)
	inactive(e.self);
	e.self:ModifyNPCStat("runspeed","0.35");
	eq.start(150);
	e.self:SpellFinished(2128, e.self);
	e.self:Shout("Minions of fear hear me now! The temple of the great Cazic Thule has been defiled. I summon you to assist me in its cleansing!");
	wave = 1;
end

function event_waypoint_arrive(e)
	if e.wp == 1 then
		if wave % 6 > 0.1 then
			e.self:Shout("In the name of the faceless, I command you, the minions of fear, ARISE!");
			e.self:SpellFinished(2128, e.self);
			spawn_wave();		
		elseif wave == 6 then
			e.self:Shout("In the name of the fearful one, prepare yourselves! I shall rend your minds with fright, dread, and terror!");
			inactive(eq.unique_spawn(48384, 0, 0, 651, 1130, -90, 170)); -- Dread
			inactive(eq.unique_spawn(48385, 0, 0, 523, 1130, -90, 85)); -- Fright
			inactive(eq.unique_spawn(48386, 0, 0, 595, 1005, -90, 0)); -- Terror
			spawn_wave();
		elseif wave == 12 then
			e.self:Shout("In the name of the fearful one, I call forth from the abyss... DREAD!");
			active(eq.get_entity_list():GetMobByNpcTypeID(48384)); -- activate Dread
		elseif wave == 18 then
			e.self:Shout("In the name of the fearful one, I call forth from the abyss... FRIGHT!");
			active(eq.get_entity_list():GetMobByNpcTypeID(48385)); -- activate Fright
		elseif wave == 24 then
			e.self:Shout("In the name of the fearful one, I call forth from the abyss... TERROR!");
			active(eq.get_entity_list():GetMobByNpcTypeID(48386)); -- activate Terror
		elseif wave == 25 then
			e.self:Shout("In the name of the fearful one, face the wrath of FEAR itself!");
			active(e.self);
			e.self:ModifyNPCStat("runspeed","1.5");
			eq.set_timer("depop", 1800000);
		end
		
		wave = wave + 1;
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.stop_timer("depop");
		cleanup();
		eq.depop();
	end
end

function spawn_wave()
	local this_mob = mobs[math.random(#mobs)];
	-- eq.zone_emote(1, "this mob is " .. this_mob);
	for i=1,math.random(3,6) do
		eq.spawn2(this_mob, 0, 0, math.random(520, 655), math.random(1050, 1135), -90, math.random(255));
	end
end

function event_death_complete(e)
	cleanup();
end

function inactive(mob)
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);
end

function active(mob)
	mob:SetBodyType(6, true);
	mob:SetSpecialAbility(24, 0);
end

function cleanup()
	local npc_list = { 48390, 48391, 48392, 48354, 48382, 48383, 48384, 48385, 48386, 48388, 48378, 48379, 48380};
	for _,v in pairs(npc_list) do
		eq.depop_all(v);
	end
end