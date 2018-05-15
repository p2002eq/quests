--Vine Ring (Derugoak_Bloodwalker)
--By Daeron

--mob tables
local event_mobs = {218345,218385}; 
local tainted_counter;
local blood_counter;

--failure variables
local fail_timer = 3 * 60 * 60;	--3 hr default
local reset_timer = 5 * 60;	--5 min default  (timer for boss reset)
local boss_depop = 50 * 60;	--50 min default for boss to depop


function EventReset()
	eq.stop_all_timers();
	tainted_counter = 1;	--triggers on 1st death
	blood_counter = 0;
end

function TaintedCounter(e)
	tainted_counter = tainted_counter + 1;
	if tainted_counter % 3 == 0 then	--spawns a bloodthirsty vegrog every 3 tainted rock kills
		SpawnVegRogs(tainted_counter/3);
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(218019) then	--A_Tainted_Rock_Beast (218019)
			eq.signal(218345,0,2*1000);	--sends signal to #A_Bloodthirsty_Vegerog (218345) to set targetable
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,1000,"The last of the tainted rock beasts crashes to the ground and yet another creature rises at the top of the temple.");
		else
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,1000,"A creature rises from the dead bodies of three tainted rock beasts.");
		end
	end	
	

end

function SpawnVegRogs(loc)
	local spawn_locs = {[1] = {540,-832,40,385}, [2] = {540,-775,40,322}, [3] = {485,-775,40,255}, [4] = {425,-775,40,192}, [5] = {425,-832,40,127}, [6] = {425,-889,40,64}, [7] = {485,-889,40,0}, [8] = {540,-889,40,445}, [9] = {508,-807,35,321}, [10] = {461,-855,35,64} }
	eq.spawn2(218345,0,0,unpack(spawn_locs[loc])); 	--#A_Bloodthirsty_Vegerog (218345)
end

function BloodCounter(e)
	blood_counter = blood_counter + 1;
	if blood_counter == 10 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(218345) then	--#A_Bloodthirsty_Vegerog (218345)
		DerugoakSpawn(e);
	end	
end

function spawn_adds(e,num) --for 4 spawn mobs (aggro is boolean)
	local spawn_locs = { [1] = {15,15}, [2] = {-15,-15}, [3] = {-15,15}, [4] = {15,-15} };
	
	for n = 1,num do
		local x,y,z = e.self:GetX() + spawn_locs[n][1], e.self:GetY() + spawn_locs[n][2], e.self:GetZ();
		mob = eq.spawn2(218023,0,0,x,y,z,0);	--A_Mangled_Vegerog (218023)
		mob:AddToHateList(e.self:GetHateTop(),1);
	end
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Derugoak summons minions to his side.") 
end

function SetHP(e)
	eq.set_next_hp_event(75);
end

function HPEvent(e)
	if e.hp_event == 75 then
		eq.set_next_hp_event(25);
		spawn_adds(e,2);
	elseif e.hp_event == 25 then
		spawn_adds(e,4);
	end
end

function SetTargetable(e)
	e.self:SetBodyType(25, true);			--Sets bodytype as Plant (targetable)
	e.self:SetSpecialAbility(24,0);			--turn off immune to aggro
	e.self:SetSpecialAbility(35,0);			--turn off immunity to players			
end

function DerugoakSpawn(e)
	local qglobals = eq.get_qglobals();
	local instance_id = eq.get_zone_instance_id();
	if qglobals[instance_id .. "_VineRing_PoEarthA"] == nil then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,1000,"The ground shakes and trembles as Derugoak Bloodwalker rises to defend his temple.") 
		BossSpawn(218385,e);	--#Derugoak_Bloodwalker (218385)
		eq.set_global(instance_id .. "_VineRing_PoEarthA", "1",3,"D3");	--blowable spawn - setting flag regardless of death
	else
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,1000,"The ground shakes and trembles as a bloodsoaked creature rises at the top of the temple.") 
		BossSpawn(218395,e);	--#A_Bloodsoaked_Vegerog (218395)
	end
end

function BossSpawn(boss_id,e)
	boss = eq.unique_spawn(boss_id,0,0,481,-842,34,510);
	boss:SetRunning(true);
	boss:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading(),true);
	eq.set_timer("depop", boss_depop * 1000, boss);	--hard depop to kill boss
end

function BossCombat(e)
	if e.joined then
		eq.set_timer("memblur",12 * 1000);
		eq.stop_timer("reset");
	else
		e.self:SaveGuardSpot(true);	--will corpse camp
		eq.set_timer("reset", reset_timer * 1000);
	end
end

function BossTimer(e)
	if e.timer == "memblur" then
		if eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(),50) then	--check if player is within 50 units
			if math.random(100) <= 30 then e.self:WipeHateList() end  	--30% memblur chance
		elseif not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
		end
	elseif e.timer == "depop" then
		EndEvent();
	elseif e.timer == "reset" then
		eq.stop_timer(e.timer);
		eq.set_next_hp_event(75);	--reset hp events incase of failure
		eq.signal(218023,99);	--A_Mangled_Vegerog (218023) to depop event adds since share NPCID with normal trash mobs
	end
end

function AddSignal(e)
	if e.signal == 99 and e.self:GetSpawnPointID() == 0 then	--event mobs would not have a valid spawnpoint
		eq.depop();
	end
end

function AddCombat(e)
	if not e.joined then	
		e.self:SaveGuardSpot(true);	--will corpse camp
	end
end

function event_timer(e)	--event failure timer reached
	if e.timer == "fail" then
		EndEvent();	
	end
end

function EndEvent()
	eq.stop_all_timers();
	DepopEvent();
	eq.signal(218023,99);	--A_Mangled_Vegerog (218023) to depop event adds since share NPCID with normal trash mobs
	eq.signal(218342,2,5 * 1000);	--#vine_controller (218342) to unload encounter
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

	--registered events
	--Phase 1 (Tainted Rock Beasts)
	eq.register_npc_event("Vine_Event", Event.death_complete, 218019, TaintedCounter);		--A_Tainted_Rock_Beast (218019)
	
	--Phase 2 (Bloodthirsty Vegrogs)
	eq.register_npc_event("Vine_Event", Event.death_complete, 218345, BloodCounter);		--#A_Bloodthirsty_Vegerog (218345)
	eq.register_npc_event("Vine_Event", Event.signal, 218345, SetTargetable);				--#A_Bloodthirsty_Vegerog (218345)
	
	
	--Derugoak_Bloodwalker (Final Phase)
	eq.register_npc_event("Vine_Event", Event.spawn, 218385, SetHP);						--#Derugoak_Bloodwalker (218385)
	eq.register_npc_event("Vine_Event", Event.hp, 218385, HPEvent);							--#Derugoak_Bloodwalker (218385)
	eq.register_npc_event("Vine_Event", Event.combat, 218385, BossCombat);				--#Derugoak_Bloodwalker (218385)
	eq.register_npc_event("Vine_Event", Event.timer, 218385, BossTimer);				--#Derugoak_Bloodwalker (218385)
	eq.register_npc_event("Vine_Event", Event.death_complete, 218385, EventWin);			--#Derugoak_Bloodwalker (218385)
	
	--Derugoak spawned adds (Depop and corpse camp handling)
	eq.register_npc_event("Vine_Event", Event.signal, 218023, AddSignal);					--A_Mangled_Vegerog (218023)
	eq.register_npc_event("Vine_Event", Event.combat, 218023, AddCombat);					--A_Mangled_Vegerog (218023)
	
	--Lootless PH Boss Events (will not call adds)
	eq.register_npc_event("Vine_Event", Event.combat, 218395, BossCombat);				--#A_Bloodsoaked_Vegerog (218395)
	eq.register_npc_event("Vine_Event", Event.timer, 218395, BossTimer);				--#A_Bloodsoaked_Vegerog (218395)
	eq.register_npc_event("Vine_Event", Event.death_complete, 218395, EventWin);		--#A_Bloodsoaked_Vegerog (218395)
end
