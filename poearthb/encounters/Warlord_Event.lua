--Warlord_Gintolaken Encounter 
--By Daeron

local event_mobs = {222151,222152,222153,222154}; --War Chieftains & Warlord

--failure variables
local fail_timer = 3 * 60 * 60;	--3 hr default
local boss_depop = 50 * 60;	--50 min default for boss to depop

function EventReset()
	eq.stop_all_timers();
end

function GetGlobals()
	qglobals = eq.get_qglobals();
	instance_id = eq.get_zone_instance_id();
end

function GalronarSpawn(e)
	GetGlobals();	
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222142) then	--A_Rock_Studded_Champion (222142)
		galronar = eq.unique_spawn(222153,0,0,61,38,-15,0);	--War_Chieftan_Galronar (222153)
		eq.set_timer("depop", boss_depop * 1000, galronar);	--hard depop to kill boss
	end
end

function AwisonoSpawn(e)
	GetGlobals();
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222139) then	--A_Myrmidon_of_Stone (222139)
		awisono = eq.unique_spawn(222151,0,0,262,280,-15,256);	--War Chieftan Awisano (222151)
		eq.set_timer("depop", boss_depop * 1000, awisono);	--hard depop to kill boss
	end	
end

function BirakSpawn(e)
	GetGlobals();
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222143) then	--A_Stonefist_Clansman (222143)
		birak = eq.unique_spawn(222152,0,0,22,320,-15,256);	--War_Chieftan_Birak (222152)
		eq.set_timer("depop", boss_depop * 1000, birak);	--hard depop to kill boss
	end	
end

function CheiftainKill(e)	
	SetRespawnTimers(e.self:GetNPCTypeID());	--set 3day respawn for trigger npcs
	eq.signal(222155,0,2*1000);		--delayed signal to check if warlord can spawn
end

function SetRespawnTimers(npcid)
	local triggers = {	[222151] = {	[1] = {369096, 369151, 369152, 369153}, [2] = {"Awisano"}	},	--War Chieftan Awisano (222151)
						[222152] = {	[1] = {369154, 369155, 369156, 369157}, [2] = {"Birak"}	},		--War_Chieftan_Birak (222152)
						[222153] = {	[1] = {369158, 369159, 369160, 369161}, [2] = {"Galronar"}	}};	--War_Chieftan_Galronar (222153)
						
	for k,v in pairs(triggers[npcid][1]) do
		spawn = eq.get_entity_list():GetSpawnByID(v):ForceDespawn();	--mobs should not have repopped but just incase
		eq.update_spawn_timer(v,259200*1000);	--3 day respawn
	end
	eq.set_global(instance_id .. "_" .. tostring(triggers[npcid][2][1]) .. "_PoEarthB", "1",3,"D3");
end

function WarlordCheck(e)
	GetGlobals();
	--eq.GM_Message(18,string.format("Warlord flag: [%s]  Awisano [%s]  Birak [%s] Galronar [%s]",tostring(qglobals[instance_id .. "_Warlord_PoEarthB"]),tostring(qglobals[instance_id .. "_Awisano_PoEarthB"]),tostring(qglobals[instance_id .. "_Birak_PoEarthB"]),tostring(qglobals[instance_id .. "_Galronar_PoEarthB"])));
	if qglobals[instance_id .. "_Warlord_PoEarthB"] == nil and qglobals[instance_id .. "_Awisano_PoEarthB"] ~= nil and qglobals[instance_id .. "_Birak_PoEarthB"] ~= nil and qglobals[instance_id .. "_Galronar_PoEarthB"] ~= nil then	
		warlord  = eq.unique_spawn(222154,0,0,430,160,-55,384);	--Warlord_Gintolaken (222154)
		eq.set_global(instance_id .. "_Warlord_PoEarthB", "1",3,"D3");		--blowable spawn - setting flag regardless of death
		eq.set_timer("depop", boss_depop * 1000, warlord);	--hard depop to kill boss
	end	
end

function BossCombat(e)
	if e.joined then
		eq.set_timer("memblur",12 * 1000);
		eq.stop_timer("reset");
	end
end

function BossTimer(e)
	if e.timer == "memblur" then
		if eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(),50) then	--check if player is within 50 units
			if math.random(100) <= 60 then 	--60% memblur chance
				e.self:Emote("slams against the ground and loses focus on the battle.");
				e.self:WipeHateList() 
			end  	
		elseif not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
		end
	elseif e.timer == "depop" then
		EndEvent();
	end
end

function event_timer(e)	--event failure timer reached
	if e.timer == "fail" then
		EndEvent();	
	end
end

function EventWin()
	eq.set_global(instance_id .. "_Warlord_PoEarthB", "2",3,"D3");		--set qglobal value that Warlord was killed
	EndEvent();
end

function EndEvent()
	eq.stop_all_timers();
	DepopEvent();
	eq.signal(222155,2);	--#warlord_controller (222155) to unload encounter
end

function DepopEvent()	
	for _,mob in pairs(event_mobs) do
		eq.depop_all(mob);
	end
end

function event_encounter_load(e)
	--event variables
	EventReset();
	eq.set_timer("fail", fail_timer * 1000);
	eq.GM_Message(18,"WARLORD ENCOUNTER LOADED");	--debug

	--registered events
	--Phase 1 (Chieftains spawn on death of trigger mobs)
	eq.register_npc_event("Warlord_Event", Event.death_complete, 222142, GalronarSpawn);	--A_Rock_Studded_Champion (222142)
	eq.register_npc_event("Warlord_Event", Event.death_complete, 222139, AwisonoSpawn);		--A_Myrmidon_of_Stone (222139)
	eq.register_npc_event("Warlord_Event", Event.death_complete, 222143, BirakSpawn);		--A_Stonefist_Clansman (222143)
	
	--Phase 2 (Chieftain Kill Checks)
	eq.register_npc_event("Warlord_Event", Event.death_complete, 222151, CheiftainKill);	--War Chieftan Awisano (222151)
	eq.register_npc_event("Warlord_Event", Event.death_complete, 222152, CheiftainKill);	--War_Chieftan_Birak (222152)
	eq.register_npc_event("Warlord_Event", Event.death_complete, 222153, CheiftainKill);	--War_Chieftan_Galronar (222153)
	
	--Chieftain Depop Timers
	eq.register_npc_event("Warlord_Event", Event.timer, 222151, BossTimer);					--War Chieftan Awisano (222151)
	eq.register_npc_event("Warlord_Event", Event.timer, 222152, BossTimer);					--War_Chieftan_Birak (222152)
	eq.register_npc_event("Warlord_Event", Event.timer, 222153, BossTimer);					--War_Chieftan_Galronar (222153)
		
	--Warlord_Gintolaken (Final Phase)
	eq.register_npc_event("Warlord_Event", Event.signal, 222155, WarlordCheck);				--#warlord_controller (222155)
	eq.register_npc_event("Warlord_Event", Event.combat, 222154, BossCombat);				--Warlord_Gintolaken (222154)
	eq.register_npc_event("Warlord_Event", Event.timer, 222154, BossTimer);					--Warlord_Gintolaken (222154)
	eq.register_npc_event("Warlord_Event", Event.death_complete, 222154, EventWin);			--Warlord_Gintolaken (222154)
	

end
