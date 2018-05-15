--Dust Ring (A_Perfected_Warder_of_Earth)
--By Daeron

--mob tables
local event_mobs = {218347,218391,218366,218376,218348};
local warder_spawn;
local x,y,z,h

--failure variables
local fail_timer = 3 * 60 * 60;	--3 hr default
local boss_depop = 50 * 60;	--50 min default for boss to depop

function EventReset()
	eq.stop_all_timers();
	trigger_counter = 1;	--triggers on 1st death
	warder_spawn = false;
	add_timer = false;
end

function SoilCheck(e)
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(218347) then	--#A_Dust_Devotee (218347)
		x,y,z,h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
		eq.local_emote({x,y,z},7,1000,"A deafening roar is heard coming from the Triumvirate of Soil.");
		eq.signal(218391,0);	--#Triumvirate_of_Soil (218391)
	end	
end

function DustSetup()
	--spawn devotees x32 at dust temple
	local temple_locs = {	[1] = {30,-725,12,261}, [2] = {-19,-725,12,261}, [3] = {23,-690,31,261}, [4] = {-10,-690,31,261}, 	-- #1 - #16 outer temple spawns, #17 - #32 inner temple spawns
							[5] = {30,-395,12,0}, [6] = {-19,-395,13,0}, [7] = {23,-430,32,0}, [8] = {-10,-430,32,0}, 
							[9] = {-159,-536,13,392}, [10] = {-159,-585,14,392},[11] = {-123,-576,31,392}, [12] = {-123,-543,31,392}, 
							[13] = {170,-536,12,131}, [14] = {170,-585,14,131}, [15] = {134,-576,31,131}, [16] = {134,-543,31,131},
							[17] = {-100,-610,31,131}, [18] = {-100,-650,31,131}, [19] = {-85,-665,31,0}, [20] = {-45,-665,31,0},
							[21] = {110,-610,31,392}, [22] = {110,-650,31,392}, [23] = {95,-665,31,0}, [24] = {55,-665,31,0},
							[25] = {110,-510,31,392}, [26] = {110,-470,31,392}, [27] = {95,-455,31,261}, [28] = {55,-455,31,261},
							[29] = {-100,-470,31,131}, [30] = {-100,-510,31,131}, [31] = {-85,-455,31,261}, [32] = {-45,-455,31,261} };
	
	for k,v in pairs(temple_locs) do
		eq.spawn2(218347,0,0,unpack(temple_locs[k]));	--#A_Dust_Devotee (218347)
	end
		
	SpawnSoils();	--Spawn #Triumvirate_of_Soil (218391) - false indicates they will not charge raid
end

function SetTargetable(e)
	e.self:SetBodyType(24, true);			--Sets bodytype as Summoned (targetable)
	e.self:SetSpecialAbility(24,0);			--turn off immune to aggro
	e.self:SetSpecialAbility(35,0);			--turn off immunity to players	
	e.self:SetRunning(true);
	e.self:CastToNPC():MoveTo(x,y,z,h,true);
end

function WarderSpawn(e)	
	x,y,z,h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
	local qglobals = eq.get_qglobals();
	local instance_id = eq.get_zone_instance_id();
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(218391) and not warder_spawn then
		if qglobals[instance_id .. "_DustRing_PoEarthA"] == nil then
			
			eq.local_emote({x,y,z},7,1000,"Within the earthen temple a warder of earth forms, perfect in every way.");
			warder_spawn = true;
			BossSpawn(218366);	--#A_Perfected_Warder_of_Earth (218366)
			
			--Fight Scenarios (1 = Triumverate of Soil adds, 2 = 3-6 Triumverate Protector adds every 45 sec, 3 = no adds)
			scenario = math.random(1,3);
			eq.GM_Message(5,string.format("Fight Scenario [%s/3]  (1 = Soils, 2 = Protectors, 3 = no adds)", scenario));
			if scenario == 1 then
				SpawnSoils();
				eq.signal(218391,0,1*1000);	--#Triumvirate_of_Soil (218391)
			elseif scenario == 2 then
				SpawnProtectors(x,y,z,h,true);
			end
			eq.set_global(instance_id .. "_DustRing_PoEarthA", "1",3,"D3");	--blowable spawn - setting flag regardless of death
		else
			BossSpawn(218348);	--#A_Dust_Follower (218348)
		end
	end
end

function SpawnProtectors(x,y,z,h,charge)
	for n = 1, math.random(3,6) do
		protector = eq.spawn2(218376,0,0,boss:GetX() + math.random(-30,30),boss:GetY() + math.random(-30,30),boss:GetZ() - 15,0);	--#A_Triumvirate_Protector (218376)
		if charge then
			protector:SetRunning(true);
			protector:CastToNPC():MoveTo(x,y,z,h,true);
		end
	end
end

function SpawnSoils(charge)	--boolean
	local locs = {[1] = {25,-560,33,392}, [2] = {-11,-541,33,209}, [3] = {-11,-580,33,55} }
	--Spawn #Triumvirate_of_Soil (218391)
	for n = 1,3 do
		eq.spawn2(218391,0,0,unpack(locs[n]));		
	end
end

function BossSpawn(boss_id)
	boss = eq.unique_spawn(boss_id,0,0,9,-560,32,0);
	boss:SetRunning(true);
	boss:CastToNPC():MoveTo(x,y,z,h,true);
	eq.set_timer("depop", boss_depop * 1000, boss);	--hard depop to kill boss
end

function SoilCombat(e)
	if e.joined then
		eq.set_timer("phase",24 * 1000);
	else
		eq.stop_timer("phase");
		e.self:SaveGuardSpot(true);
	end
end

function AddCombat(e)
	if not e.joined then
		e.self:SaveGuardSpot(true);
	end
end

function SoilTimers(e)
	if e.timer == "phase" then
		eq.stop_timer(e.timer);
		eq.set_timer("phase", math.random(12,24) * 1000);
		rand = math.random(1,100);
		if rand <= 40 then 
			e.self:SetRace(233)	--Race #233 for ground shaker model(shrunken)
		else
			e.self:SetRace(75);	--Elemental
		end
	end
end	

function BossCombat(e)
	if e.joined then
		eq.stop_timer("reset");
		eq.set_timer("memblur",12 * 1000);
		if scenario == 2 and not add_timer then
			add_timer = true;
			eq.set_timer("adds", 30 * 1000);
			if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(218376) then
				SpawnProtectors(0,0,0,false);	--spawn adds on engage if previously despawned 
			end			
		end
	else
		e.self:SaveGuardSpot(true);
		eq.set_timer("reset", 5 * 60 * 1000);  --5 min reset to depop adds
	end
end

function BossTimer(e)
	if e.timer == "memblur" then
		if eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(),50) then	--check if player is within 50 units
			if math.random(100) <= 30 then e.self:WipeHateList() end  	--30% memblur chance
		elseif not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
		end
	elseif e.timer == "adds" then
		if e.self:IsEngaged() then
			eq.stop_timer("reset");
			SpawnProtectors(0,0,0,false);	--no coords needed
		end
	elseif e.timer == "reset" and not e.self:IsEngaged() then
		eq.stop_timer(e.timer);
		eq.stop_timer("adds");
		add_timer = false;
		eq.depop_all(218376);	--#A_Triumvirate_Protector (218376)
	elseif e.timer == "depop" then
		EndEvent();
	end
end

function event_timer(e)
	if e.timer == "fail" then
		EndEvent();
	end
end

function EndEvent()
	eq.stop_all_timers();
	DepopEvent();
	eq.signal(218393,2);	--#dust_controller (218393) to unload encounter
end
	
function DepopEvent()	
	for _,mob in pairs(event_mobs) do
		eq.depop_all(mob);
	end
end

function EventWin()
	eq.signal(218394,0)	--#arbitor_controller (218394)
	EndEvent();
end

function event_encounter_load(e)
	--event variables
	EventReset();
	eq.set_timer("fail", fail_timer * 1000);
	DustSetup();

	--registered events
	--Phase 1
	eq.register_npc_event("Dust_Event", Event.death_complete, 218347, SoilCheck);			--#A_Dust_Devotee (218347)
	
	--Phase 2
	eq.register_npc_event("Dust_Event", Event.death_complete, 218391, WarderSpawn);			--#Triumvirate_of_Soil (218391)
	eq.register_npc_event("Dust_Event", Event.signal, 218391, SetTargetable);				--#Triumvirate_of_Soil (218391)
	eq.register_npc_event("Dust_Event", Event.combat, 218391, SoilCombat);					--#Triumvirate_of_Soil (218391)
	eq.register_npc_event("Dust_Event", Event.timer, 218391, SoilTimers);					--#Triumvirate_of_Soil (218391)
	
	--A_Perfected_Warder_of_Earth (Final Phase)
	eq.register_npc_event("Dust_Event", Event.combat, 218366, BossCombat);					--#A_Perfected_Warder_of_Earth (218366)
	eq.register_npc_event("Dust_Event", Event.timer, 218366, BossTimer);					--#A_Perfected_Warder_of_Earth (218366)
	eq.register_npc_event("Dust_Event", Event.death_complete, 218366, EventWin);			--#A_Perfected_Warder_of_Earth (218366)
	eq.register_npc_event("Dust_Event", Event.combat, 218376, AddCombat);					--#A_Triumvirate_Protector (218376)

	--#A_Dust_Follower (Lootless PH Mob)
	eq.register_npc_event("Dust_Event", Event.combat, 218348, BossCombat);					--#A_Dust_Follower (218348)
	eq.register_npc_event("Dust_Event", Event.timer, 218348, BossTimer);					--#A_Dust_Follower (218348)
	eq.register_npc_event("Dust_Event", Event.death_complete, 218348, EventWin);			--#A_Dust_Follower (218348)
	
	
	
end 
