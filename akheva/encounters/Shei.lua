-- Shei (179032) event in Akheva ruins

primary_adds = { 179357, 179358, 179359, 179360 };
secondary_adds = { 179352, 179353, 179354, 179355 };

function event_encounter_load(e)
	eq.unique_spawn(179032, 0, 0, -1736, 1082, 22.6, 64);

	eq.register_npc_event("Shei", Event.spawn, 179032, SheiSpawn);
	eq.register_npc_event("Shei", Event.combat, 179032, SheiCombat);
	eq.register_npc_event("Shei", Event.timer, 179032, SheiTimer);
	eq.register_npc_event("Shei", Event.death_complete, 179032, SheiDeath);
	
	eq.register_npc_event("Shei", Event.slay, 179032, AddsonKill);
	eq.register_npc_event("Shei", Event.slay, 179357, AddsonKill);
	eq.register_npc_event("Shei", Event.slay, 179358, AddsonKill);
	eq.register_npc_event("Shei", Event.slay, 179359, AddsonKill);
	eq.register_npc_event("Shei", Event.slay, 179360, AddsonKill);
	
	eq.register_npc_event("Shei", Event.death_complete, 179357, AddRespawn);
	eq.register_npc_event("Shei", Event.death_complete, 179358, AddRespawn);
	eq.register_npc_event("Shei", Event.death_complete, 179359, AddRespawn);
	eq.register_npc_event("Shei", Event.death_complete, 179360, AddRespawn);
end

function AddRespawn(e)
	eq.unique_spawn(e.self:GetNPCTypeID(),0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

function SheiDeath(e)
	cleanup();
	eq.set_timer("shei_unload", 1000);
end

function AddsonKill(e)
	local mob = eq.ChooseRandom(unpack(secondary_adds));
	eq.spawn2(mob,0,0,e.other:GetX(),e.other:GetY(),e.other:GetZ(),e.other:GetHeading());
end

function SheiTimer(e)
	if e.timer == "shei_dt" then
		shei_dt(e.self);
	elseif e.timer == "shei_despawn_full" then
		eq.stop_timer(e.timer);
		cleanup();
		e.self:Depop();
	elseif e.timer == "shei_despawn_adds" then
		eq.stop_timer(e.timer);
		cleanup();
	elseif e.timer == "shei_unload" then
		eq.stop_timer(e.timer);
		eq.unload_encounter("Shei");
	end
end

function SheiSpawn(e)
	eq.set_timer("shei_despawn_full", 60 * 60 * 1000); -- 1 hour total uptime
end

function SheiCombat(e)
	if e.joined then
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(179357) then
			eq.unique_spawn(179357,0,0,-1714,1128,19.7,128); -- #Xin`Xokra
			eq.unique_spawn(179358,0,0,-1769,1035,18.2,45); -- #Xin`Xakru
			eq.unique_spawn(179359,0,0,-1771,1126,18.2,82); -- #Xin`Xakri
			eq.unique_spawn(179360,0,0,-1715,1034,19.7,0); -- #Xin`Xakre
		end
		shei_dt(e.self);
		eq.set_timer("shei_dt", 2 * 60 * 1000);
		eq.stop_timer("shei_despawn_adds");
	else
		eq.stop_timer("shei_dt");
		eq.set_timer("shei_despawn_adds", 5 * 60 * 1000); -- 5 Minute add despawn (Soft Reset)
	end
end

function shei_dt(shei)
	shei:SpellFinished(2859,shei:GetHateTop());
end

function cleanup()
	for _,v in pairs(primary_adds) do
		eq.depop_all(v);
	end
	
	for _,v in pairs(secondary_adds) do
		eq.depop_all(v);
	end
end
