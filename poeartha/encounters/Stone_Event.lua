--Stone Ring (Peregrin_Rockskull)
--By Daeron

--mob tables
local event_mobs = {218373,218374,218359,218388,218383};
local phase1_counter;
local rubble_counter;
local phase3_counter;
local target;

--Phase 1 NPC triggers
local crumbling;
local thrower;
local pile;
local creation;
local wave;

--failure variables
local fail_timer = 3 * 60 * 60;	--3 hr default
local boss_depop = 50 * 60;	--50 min default for boss to depop


function EventReset()
	eq.stop_all_timers();
	phase1_counter = 0;
	rubble_counter = 0;
	phase3_counter = 0;
	crumbling = false;
	thrower = false;
	pile = false;
	creation = false;
	wave = 1;
end

function TrashCounter(e)
	x,y,z = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(218033) and not thrower then	--A_Boulder_Thrower (218033)
		eq.local_emote({x,y,z},7,500,"The ground shudders as stone fortifications are summoned forth.");
		thrower = true;
		phase1_counter = phase1_counter + 1;
		
		eq.spawn2(218373,0,0,-590,-278,83,131);	--#A_Stone_Fortification (218373)
		eq.spawn2(218373,0,0,-590,-268,83,131);
		eq.spawn2(218373,0,0,-590,-258,83,131);
		eq.spawn2(218373,0,0,-590,-248,83,131);
		
		eq.spawn2(218373,0,0,-583,-278,83,131);
		eq.spawn2(218373,0,0,-583,-268,83,131);
		eq.spawn2(218373,0,0,-583,-258,83,131);
		eq.spawn2(218373,0,0,-583,-248,83,131);
		
		eq.spawn2(218373,0,0,-576,-278,83,131);
		eq.spawn2(218373,0,0,-576,-268,83,131);
		eq.spawn2(218373,0,0,-576,-258,83,131);
		eq.spawn2(218373,0,0,-576,-248,83,131);
	
	elseif not eq.get_entity_list():IsMobSpawnedByNpcTypeID(218030) and not pile then	--A_Pile_of_Boulders (218030)
		eq.local_emote({x,y,z},7,500,"The ground shudders as stone fortifications are summoned forth.");
		pile = true;
		phase1_counter = phase1_counter + 1;

		eq.spawn2(218373,0,0,-617,-285,83,261);	--#A_Stone_Fortification (218373)
		eq.spawn2(218373,0,0,-617,-290,83,261);	
		eq.spawn2(218373,0,0,-617,-295,83,261);
		eq.spawn2(218373,0,0,-617,-300,83,261);
		eq.spawn2(218373,0,0,-617,-305,83,261);
		eq.spawn2(218373,0,0,-617,-310,83,261);
		eq.spawn2(218373,0,0,-607,-310,83,261);
		eq.spawn2(218373,0,0,-627,-310,83,261);
		eq.spawn2(218373,0,0,-597,-310,83,261);
		eq.spawn2(218373,0,0,-637,-310,83,261);
		
	
	elseif not eq.get_entity_list():IsMobSpawnedByNpcTypeID(218031) and not crumbling then	--A_Crumbling_Stone_Mass (218031)
		eq.local_emote({x,y,z},7,500,"The ground shudders as stone fortifications are summoned forth.");
		crumbling = true;
		phase1_counter = phase1_counter + 1;
		
		eq.spawn2(218373,0,0,-642,-278,83,392);	--#A_Stone_Fortification (218373)
		eq.spawn2(218373,0,0,-642,-268,83,392);
		eq.spawn2(218373,0,0,-642,-258,83,392);
		eq.spawn2(218373,0,0,-642,-248,83,392);
		
		eq.spawn2(218373,0,0,-649,-278,83,392);
		eq.spawn2(218373,0,0,-649,-268,83,392);
		eq.spawn2(218373,0,0,-649,-258,83,392);
		eq.spawn2(218373,0,0,-649,-248,83,392);
		
		eq.spawn2(218373,0,0,-656,-278,83,392);
		eq.spawn2(218373,0,0,-656,-268,83,392);
		eq.spawn2(218373,0,0,-656,-258,83,392);
		eq.spawn2(218373,0,0,-656,-248,83,392);
		
	elseif not eq.get_entity_list():IsMobSpawnedByNpcTypeID(218032) and not creation then	--A_Rock_Creation (218032)
		eq.local_emote({x,y,z},7,500,"The ground shudders as stone fortifications are summoned forth.");
		creation = true;
		phase1_counter = phase1_counter + 1;
		
		eq.spawn2(218373,0,0,-617,-237,83,0);	--#A_Stone_Fortification (218373)
		eq.spawn2(218373,0,0,-612,-232,83,0);
		eq.spawn2(218373,0,0,-622,-232,83,0);
		eq.spawn2(218373,0,0,-617,-227,83,0);
		eq.spawn2(218373,0,0,-627,-227,83,0);
		eq.spawn2(218373,0,0,-607,-227,83,0);
		eq.spawn2(218373,0,0,-612,-222,83,0);
		eq.spawn2(218373,0,0,-622,-222,83,0);
		eq.spawn2(218373,0,0,-632,-222,83,0);
		eq.spawn2(218373,0,0,-602,-222,83,0);
		eq.spawn2(218373,0,0,-617,-215,83,0);
		eq.spawn2(218373,0,0,-627,-215,83,0);
		eq.spawn2(218373,0,0,-607,-215,83,0);
		eq.spawn2(218373,0,0,-637,-215,83,0);
		eq.spawn2(218373,0,0,-597,-215,83,0);
	end	
end

function FortifiedCheck(e)
	x,y,z = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
	if phase1_counter == 4 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(218373) then	--#A_Stone_Fortification (218373)
		eq.local_emote({x,y,z},7,1000,"The Rock Monstrosity crumbles into mounds of rubble.")
		eq.depop_with_timer(218029);	--A_Rock_Monstrosity (218029)
		spawn_mobs(218359,false);	--4X #A_Mound_of_Rubble (218359) (will not aggro raid immediately)
	end
end

function spawn_mobs(npc_id, charge) --for 4 spawn mobs (aggro is boolean)
	local spawn_locs = { [1] = {-690,-330,87,392}, [2] = {-545,-330,87,392}, [3] = {-545,-195,87,392}, [4] = {-690,-195,87,392} };
	
	for n = 1,4 do
		mob = eq.spawn2(npc_id,0,0,unpack(spawn_locs[n]));
		if charge then 
			mob:SetRunning(true);
			mob:CastToNPC():MoveTo(x,y,z,h,true);
		end
	end
end

function SetHP(e)
	eq.set_next_hp_event(10);
end

function HPEvent(e)
	local loc_table = {[1] = {-600,-279,90,450}, [2] = {-600,-245,90,318}, [3] = {-632,-245,90,194}, [4] = {-632,-279,90,65} };
	if e.hp_event == 10 then
		x,y,z,h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();	--update locs
		rubble_counter = rubble_counter + 1;
		e.self:SetSpecialAbility(24,1);		--turn off immune to aggro
		e.self:SetSpecialAbility(35,1);		--turn off immunity to players
		e.self:BuffFadeAll();
		e.self:WipeHateList();
		e.self:HealDamage(100000);
		e.self:MoveTo(loc_table[rubble_counter][1],loc_table[rubble_counter][2],loc_table[rubble_counter][3],loc_table[rubble_counter][4],true);
		eq.set_timer("depop_check", 1 * 1000, controller);
	end
end

function RubbleTimer(e)
	if e.timer == "depop_check" then
		local counter = 0;
		local mob_list = eq.get_entity_list():GetMobList();
		
		if mob_list ~= nil then
			for mob in mob_list.entries do
				if mob:GetNPCTypeID() == 218359 and mob:CalculateDistance(-620,-265,90) <= 40 then
					counter = counter + 1;
				end
			end
		end
		
		--Activate if counter is met
		if counter == 4 and rubble_counter == 4 then
			eq.stop_timer(e.timer);
			eq.depop_all(218359);
			eq.local_emote({x,y,z},7,1000, "The mounds of rubble reform back into the Rock Monstrosity.");
			eq.get_entity_list():GetSpawnByID(366842):Repop();	--repop A_Rock_Monstrosity (218029)
			eq.signal(218029,0,2*1000);	--signal A_Rock_Monstrosity (218029) to be targetable
		end
	end
end

function SetTargetable(e)
	e.self:SetBodyType(24, true);				--Sets bodytype as Summoned (targetable)
	e.self:SetSpecialAbility(24,0);			--turn off immune to aggro
	e.self:SetSpecialAbility(35,0);			--turn off immunity to players			
	e.self:SetRunning(true);
	e.self:CastToNPC():MoveTo(x,y,z,h,true);
end

function PeregrinSpawn(e)
	x,y,z,h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
	local qglobals = eq.get_qglobals();
	local instance_id = eq.get_zone_instance_id();
	if qglobals[instance_id .. "_StoneRing_PoEarthA"] == nil then
		boss = eq.unique_spawn(218388,0,0,-613,-261,95,131);	--#Peregrin_Rockskull (218388)
		boss:SetAppearance(3);		
		eq.set_global(instance_id .. "_StoneRing_PoEarthA", "1",3,"D3");	--blowable spawn - setting flag regardless of death
	else
		boss = eq.unique_spawn(218383,0,0,-613,-261,95,131);	--#An_Encrusted_Dirt_Cloud (218383) PH Version
		boss:SetAppearance(3);	--lay down
	end
	eq.local_emote({x,y,z},7,1000,"A gigantic formation of rocks appears, glowing with barely contained fury. It collapses to the ground in a pile of rubble, as heaps of misshapen stone rise from the corners of the temple and close in to attack!")
	spawn_mobs(218374,true); --#A_Stone_Heap (218374)
end

function SpawnHeaps(e)
	x,y,z,h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
	phase3_counter = phase3_counter + 1;
	if wave == 6 and phase3_counter == 4 then
		eq.local_emote({x,y,z},7,1000,"As the last of the stone heaps collapses, the gigantic formation of rocks slowly rises to its feet. A gravelly voice echoes in your mind, 'Fools! Invaders! It's been ages since this plane was fouled with the stench of your kind. Prepare to meet your end.' The large rock man then readies itself for attack.");
		eq.signal(boss:GetNPCTypeID(),0,2*1000);	--signal boss to be targetable
		eq.set_timer("depop", boss_depop * 1000, boss);	--50 min hard depop once activated
	elseif phase3_counter == 4 then
		eq.local_emote({x,y,z},7,1000,"Heaps of misshapen rise from the corners of the temple and close in to attack!");
		phase3_counter = 0;
		wave = wave + 1;
		spawn_mobs(218374,true); --#A_Stone_Heap (218374)
	end
end

function EventCombat(e)	--corpse camping mobs
	if not e.joined then
		e.self:SaveGuardSpot(true);
	end
end

function BossCombat(e)
	if e.joined then
		eq.set_timer("memblur",12 * 1000);
	else
		e.self:SaveGuardSpot(true);
	end
end

function BossTimer(e)
	if e.timer == "memblur" then
		if eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(),50) then	--check if player is within 50 units
			if math.random(100) <= 40 then e.self:WipeHateList() end  	--40% memblur chance
		elseif not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
		end
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
	eq.signal(218036,2);	--stone_controller (218036) to unload encounter
end
	
function DepopEvent()	
	for _,mob in pairs(event_mobs) do
		eq.depop_all(mob);
	end
end

function EventWin(e)
	x,y,z,h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
	if e.self:GetNPCTypeID() == 218388 then
		eq.local_emote({x,y,z},7,1000,"The rock man tumbles to the ground, now dead.  Peregrin Rockskull has been defeated.");
	end
	eq.signal(218394,0)	--#arbitor_controller (218394)
	
	EndEvent();
end

function event_encounter_load(e)
	--event variables
	EventReset();
	eq.set_timer("fail", fail_timer * 1000);
	controller = eq.get_entity_list():GetMobByNpcTypeID(218036);	--stone_controller (218036)

	--registered events
	--Phase 1
	eq.register_npc_event("Stone_Event", Event.death_complete, 218033, TrashCounter);		--A_Boulder_Thrower (218033)
	eq.register_npc_event("Stone_Event", Event.death_complete, 218030, TrashCounter);		--A_Pile_of_Boulders (218030)
	eq.register_npc_event("Stone_Event", Event.death_complete, 218031, TrashCounter);		--A_Crumbling_Stone_Mass (218031)
	eq.register_npc_event("Stone_Event", Event.death_complete, 218032, TrashCounter);		--A_Rock_Creation (218032)
	eq.register_npc_event("Stone_Event", Event.death_complete, 218373, FortifiedCheck);		--#A_Stone_Fortification (218373)

	--Phase 2 (Mounds of Rubble)
	eq.register_npc_event("Stone_Event", Event.spawn, 218359, SetHP);						--#A_Mound_of_Rubble (218359)
	eq.register_npc_event("Stone_Event", Event.hp, 218359, HPEvent);						--#A_Mound_of_Rubble (218359)
	eq.register_npc_event("Stone_Event", Event.combat, 218359, EventCombat);				--#A_Mound_of_Rubble (218359)
	eq.register_npc_event("Stone_Event", Event.timer, 218036, RubbleTimer);					--stone_controller (218036)
	
	--Phase 3(Rock Monstrosity)
	eq.register_npc_event("Stone_Event", Event.death_complete, 218029, PeregrinSpawn);		--A_Rock_Monstrosity (218029)
	eq.register_npc_event("Stone_Event", Event.combat, 218029, EventCombat);				--A_Rock_Monstrosity (218029)
	eq.register_npc_event("Stone_Event", Event.signal, 218029, SetTargetable);				--A_Rock_Monstrosity (218029)
	
	--Phase 4(Stone Heaps)
	eq.register_npc_event("Stone_Event", Event.death_complete, 218374, SpawnHeaps);			--#A_Stone_Heap (218374)
	eq.register_npc_event("Stone_Event", Event.combat, 218374, EventCombat);				--#A_Stone_Heap (218374)
	
	--Peregrin_Rockskull (Final Phase)
	eq.register_npc_event("Stone_Event", Event.combat, 218388, BossCombat);					--#Peregrin_Rockskull (218388)
	eq.register_npc_event("Stone_Event", Event.timer, 218388, BossTimer);					--#Peregrin_Rockskull (218388)
	eq.register_npc_event("Stone_Event", Event.death_complete, 218388, EventWin);			--#Peregrin_Rockskull (218388)
	eq.register_npc_event("Stone_Event", Event.signal, 218388, SetTargetable);				--#Peregrin_Rockskull (218388)
	
	--Peregrin_Rockskull PH Version
	eq.register_npc_event("Stone_Event", Event.combat, 218383, BossCombat);					--#An_Encrusted_Dirt_Cloud (218383)
	eq.register_npc_event("Stone_Event", Event.timer, 218383, BossTimer);					--#An_Encrusted_Dirt_Cloud (218383)
	eq.register_npc_event("Stone_Event", Event.death_complete, 218383, EventWin);			--#An_Encrusted_Dirt_Cloud (218383)
	eq.register_npc_event("Stone_Event", Event.signal, 218383, SetTargetable);				--#An_Encrusted_Dirt_Cloud (218383)
end
