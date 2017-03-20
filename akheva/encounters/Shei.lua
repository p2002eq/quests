-- Shei (179349/179032) event in Akheva ruins
-- NOTE THAT HIS DT IS CODED IN THE LUA - HE SHOULD NOT HAVE A DT ON HIS SPELL LIST!

primary_adds = {
	[179357] = {-1714, 1128, 20, 128};
	[179358] = {-1769, 1035, 20, 45};
	[179359] = {-1771, 1126, 20, 82};
	[179360] = {-1715, 1034, 20, 0};
}
secondary_adds = { 179352, 179353, 179354, 179355 };

function event_encounter_load(e)
	eq.set_timer("hb", 10 * 1000);

	eq.register_npc_event("Shei", Event.combat, 179349, SheiCombat);
	eq.register_npc_event("Shei", Event.timer, 179349, SheiTimer);
	eq.register_npc_event("Shei", Event.death_complete, 179349, FakeSheiDeath);
	
	eq.register_npc_event("Shei", Event.combat, 179032, SheiCombat);
	eq.register_npc_event("Shei", Event.timer, 179032, SheiTimer);
	
	eq.register_npc_event("Shei", Event.slay, 179032, AddsonKill);
	eq.register_npc_event("Shei", Event.slay, 179349, AddsonKill);
	eq.register_npc_event("Shei", Event.slay, 179357, AddsonKill);
	eq.register_npc_event("Shei", Event.slay, 179358, AddsonKill);
	eq.register_npc_event("Shei", Event.slay, 179359, AddsonKill);
	eq.register_npc_event("Shei", Event.slay, 179360, AddsonKill);
	eq.register_npc_event("Shei", Event.slay, 179352, AddsonKill);
	eq.register_npc_event("Shei", Event.slay, 179353, AddsonKill);
	eq.register_npc_event("Shei", Event.slay, 179354, AddsonKill);
	eq.register_npc_event("Shei", Event.slay, 179355, AddsonKill);
	
	eq.register_npc_event("Shei", Event.death_complete, 179357, AddRespawn);
	eq.register_npc_event("Shei", Event.death_complete, 179358, AddRespawn);
	eq.register_npc_event("Shei", Event.death_complete, 179359, AddRespawn);
	eq.register_npc_event("Shei", Event.death_complete, 179360, AddRespawn);
	
	eq.register_player_event("Shei", Event.say, Response);
end

function Response(e)
	e.self:Message(6, "EVENT IS ACTIVE"); 
end

function event_timer(e)
	if e.timer == 'hb' then
		eq.zone_emote(1, 'HB trigger');
		local ent_list = eq.get_entity_list();
		if not ent_list:IsMobSpawnedByNpcTypeID(179032) and not ent_list:IsMobSpawnedByNpcTypeID(179349) then
			eq.stop_timer(e.timer);
			eq.zone_emote(1, 'EndEncounter');
			eq.unload_encounter("Shei");
		end
	end
end

function AddRespawn(e)
	local id = e.self:GetNPCTypeID()
	local loc = primary_adds[id]
	local newadd = eq.spawn2(id,0,0,loc[1],loc[2],loc[3],loc[4]);
	--eq.set_timer('depop', 90 * 60 * 1000, newadd);
	eq.set_timer('depop', 30 * 1000, newadd);
end

function AddsonKill(e)
	if e.other:IsClient() or e.other:IsPet() then -- not sure why this is necessary, but otherwise will occasionally spawn adds when an event mob dies
		e.self:Emote('strikes through the chest of the corpse, rending the soul from the flesh and animating it into an undead servant.')
		local mob = eq.ChooseRandom(unpack(secondary_adds));
		local newadd = eq.spawn2(mob,0,0,e.other:GetX(),e.other:GetY(),e.other:GetZ(),e.other:GetHeading());
		--eq.set_timer('depop', 90 * 60 * 1000, newadd);
		eq.set_timer('depop', 30 * 1000, newadd);
	end
end

function SheiCombat(e)
	if e.joined then
		e.self:Say('Sivuelaeus Rulour ans Rashan!');
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(179357) then
			for id,loc in pairs(primary_adds) do
				local newadd = eq.unique_spawn(id,0,0,loc[1],loc[2],loc[3],loc[4]);
					--eq.set_timer('depop', 90 * 60 * 1000, newadd);
					eq.set_timer('depop', 30 * 1000, newadd);
			end
		end
		if e.self:GetNPCTypeID() == 179032 then
			eq.set_timer("shei_dt", math.random(30) * 1000)
			eq.set_timer('aggro_guards', 30 * 1000);
		end
	else
		if e.self:GetNPCTypeID() == 179032 then
			eq.stop_timer("shei_dt");
			eq.stop_timer('aggro_guards');
		end
	end
end

function FakeSheiDeath(e)
	eq.unique_spawn(179032, 0, 0, -1736, 1082, 22.6, 64);
	eq.set_timer("shei_despawn_full", 60 * 60 * 1000); -- 1 hour total uptime
end

function SheiTimer(e)
	eq.stop_timer(e.timer);
	if e.timer == "shei_dt" then
		e.self:SpellFinished(2859,e.self:GetTarget());
		eq.set_timer("shei_dt", 2 * 60 * 1000);
	elseif e.timer == 'aggro_guards' then
		aggro_guards(e.self:GetTarget());
		eq.set_timer("aggro_guards", 30 * 1000);
	elseif e.timer == "shei_despawn_full" then
		e.self:Depop();
	end
end

function aggro_guards(mob)
	for guard,_ in pairs(primary_adds) do
		local guard_mob = eq.get_entity_list():GetNPCByNPCTypeID(guard);
		if guard_mob ~= nil then
			guard_mob:AddToHateList(mob);
		end
	end
end

function cleanup()
	eq.zone_emote(1, 'CLEANUP trigger');
	
	for v,_ in pairs(primary_adds) do
		while eq.get_entity_list():IsMobSpawnedByNpcTypeID(v) do
			eq.get_entity_list():GetMobByNpcTypeID(v):Depop();
		end
	end
	
	for _,v in pairs(secondary_adds) do
		while eq.get_entity_list():IsMobSpawnedByNpcTypeID(v) do
			eq.get_entity_list():GetMobByNpcTypeID(v):Depop();
		end
	end
end
