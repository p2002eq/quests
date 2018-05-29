--Rallos Zek the Warlord Event
--By Daeron

local aggro_limit = 72;		--max clients on rztw hatelist before banish

--spawnpoint tables
local pit_spawns = {361134,361166,361167,361170,361173,361176,361188,361191,361192,361193,361194,361195,361196,361197,361198,361199,361202,361203,361204,361205,361206,361208,361209,361211,361212,361219};


--failure variables
local fail_timer = 20*60;	--20min for phase 1
local fail = false;
local timer;

 
function event_encounter_load(e)
	--event variables
	EventReset();
	eq.set_global(tostring(eq.get_zone_instance_id()) .. "_rztw_event", "1", 3, "H1");
	
	--registered events		
	--event fail monitor
	eq.register_npc_event("rztw_event", Event.timer, 214108, FailTimers);				--#rztw_controller (214108) monitors fail timer on each phase
	
	--Phase 1 events
	eq.register_npc_event("rztw_event", Event.spawn, 214296, VallonSpawn);				--Set HP event for VZ on spawn
	eq.register_npc_event("rztw_event", Event.hp, 214296, VallonSplit);					--Split mobs
	eq.register_npc_event("rztw_event", Event.death_complete, 214296, Phase2Check);		--#Vallon Zek
	eq.register_npc_event("rztw_event", Event.death_complete, 214299, Phase2Check);		--#Tallon Zek
	
	--Phase 2 events
	eq.register_npc_event("rztw_event", Event.signal, 214052, RZ_Activate);				--#Rallos_Zek
	eq.register_npc_event("rztw_event", Event.hp, 214052, RZ_hp);
	eq.register_npc_event("rztw_event", Event.spawn, 214307, EliteAggro);				--Decorin_Elite
	
	--Phase 3 events
	eq.register_npc_event("rztw_event", Event.combat, 214298, RZTW_Combat);				--#Rallos_Zek_the_Warlord (214298)
	eq.register_npc_event("rztw_event", Event.timer, 214298, RZTW_Timers);				--#Rallos_Zek_the_Warlord (214298)
	eq.register_npc_event("rztw_event", Event.death_complete, 214298, EventWin);		--#Rallos_Zek_the_Warlord (214298)
	
	Phase1Start();
end

function Phase1Start()		--Load Phase 1
	eq.zone_emote(7,"The air of Drunder grows strangely cold as a rumble shakes through the fortress' walls.  The Warlord stirs.");
	eq.unique_spawn(214296,251,0,555,580,170,384);	--#Vallon Zek on Grid 251
	eq.unique_spawn(214299,250,0,555,-560,170,384);	--#Tallon Zek on Grid 250
	controller = eq.get_entity_list():GetMobByNpcTypeID(214108);	--#rztw_controller (214108)
	eq.set_timer("fail", 20 * 60 * 1000,controller);	
	
	--set trigger mob spawntimers to 1hr (will repop sooner if Rztw event is failed and fake RZ repops)
	eq.update_spawn_timer(361190,60 * 60 * 1000);	--Decorin Berik
	eq.update_spawn_timer(361200,60 * 60 * 1000);	--Decorin_Grunhork (214057)
end

function FailTimers(e)
	if e.timer == "fail" then
		eq.stop_timer(e.timer);
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(214052) then
			eq.depop(214052);	--depop Fake RZ if up
			eq.get_entity_list():GetSpawnByID(361379):Repop(5);	--respawn fake rallos to allow event to trigger again
		end
		DepopEvent();
		eq.signal(214108,1, 5 * 1000)	--#rztw_controller (214108) signals encounter unload
	end
end

function VallonSpawn(e)
	eq.set_next_hp_event(50);
end

function VallonSplit(e)
	if e.hp_event == 50 then
		fake1 = eq.spawn2(214300,0,0,e.self:GetX() + math.random(-10,10), e.self:GetY() + math.random(-10,10), e.self:GetZ(), e.self:GetHeading())
		fake2 = eq.spawn2(214300,0,0,e.self:GetX() + math.random(-10,10), e.self:GetY() + math.random(-10,10), e.self:GetZ(), e.self:GetHeading())
		eq.set_next_inc_hp_event(98);
	end
	
	if e.inc_hp_event == 98 then
		fake1:Depop();
		fake2:Depop();
		eq.set_next_hp_event(60);
	end
end

function Phase2Check(e)
	local vallon = eq.get_entity_list():IsMobSpawnedByNpcTypeID(214296); 	--#Vallon Zek
	local tallon = eq.get_entity_list():IsMobSpawnedByNpcTypeID(214299); 	--#Tallon Zek
	if not vallon and not tallon then
		eq.signal(214052,1);	--signal RZ to activate
		eq.zone_emote(7,"A tremor rumbles through the halls of Drunder.  Terror wells up inside you as you struggle to keep your footing.");
	end
	eq.stop_timer("fail",controller);
	eq.set_timer("fail", 15 * 60 * 1000, controller);	--set phase 2 fail timer
end

function RZ_Activate(e)
	e.self:SetBodyType(19,true);
	e.self:SetSpecialAbility(24, 0);	--will not aggro
	e.self:SetSpecialAbility(35, 0);	--immune to players
	eq.set_next_hp_event(75);
end

function RZ_hp(e)
	if e.hp_event == 75 then
		eq.zone_emote(7,"A great cry echoes across the field of blood and through the halls of Drunder.  The creatures in the arena flee to avoid the impending doom.");
		DepopPit();	--clear pit spawns except for dead bodies
		SpawnElites();
		eq.set_next_hp_event(65);
		eq.set_next_inc_hp_event(98);
	elseif e.hp_event == 65 then
		SpawnElites();
		eq.set_next_hp_event(55);		
	elseif e.hp_event == 55 then
		e.self:Emote("laughs in an ominous tone of death.  'Flee whelps! Flee before the might of the Warlord!'");
		eq.unique_spawn(214298,0,0,689,0,-292,130);	--#Rallos_Zek_the_Warlord (214298)
		eq.stop_timer("fail", controller);
		eq.set_timer("fail", 20 * 60 * 1000, controller);	--Set Phase 3 fail timer
		eq.depop_with_timer();
	end
	
	if e.inc_hp_event == 98 then
		eq.set_next_hp_event(75);
		eq.depop_all(214307);	--Decorin_Elite depop on fail/reset
	end
end

function SpawnElites()
	local spawn_locs = {[1] = {318,580,160,384}, [2] = {318,-560,160,384} };
	for n = 1,2 do
		eq.spawn2(214307,0,0,unpack(spawn_locs[n]));	--Decorin_Elite
	end
end

function EliteAggro(e)
	local rallos = eq.get_entity_list():GetMobByNpcTypeID(214052); 	--#Rallos_Zek
	e.self:SetRunning(true);	
	e.self:CastToNPC():MoveTo(261 + math.random(-10,10),-4 + math.random(-10,10),175,510,true);
	e.self:AddToHateList(rallos:GetHateRandom(),1);
end

--Rallos Zek the Warlord Functions

function RZTW_Combat(e)
	local rztw = eq.get_entity_list():GetMobByNpcTypeID(214298); 	--#Rallos_Zek_the_Warlord (214298)
	if e.joined then
		eq.set_timer("adds", 70 * 1000); 	--start add timer
		eq.set_timer("scan",1*1000);	--start checking hatelist
	else
		eq.stop_timer("adds");
		eq.stop_timer("scan");
		eq.set_timer("reset", 5 * 60 * 1000);	--in event of wipe
	end
end

function RZTW_Timers(e)
	local rztw = eq.get_entity_list():GetMobByNpcTypeID(214298); 	--#Rallos_Zek_the_Warlord (214298)
	if e.timer == "adds" and e.self:IsEngaged() then
		eq.stop_timer(e.timer);
		eq.set_timer("adds", 55 * 1000);	--timer is set to 55 seconds after initial engage timer
		spawn_adds(e);
	elseif e.timer == "reset" then
		if not e.self:IsEngaged() and e.self:GetHPRatio() == 100 then
			eq.stop_timer(e.timer);
			eq.depop_all(214308);	--a_Chaos_Wraith (214308)
			eq.depop_all(214309);	--a_Chaos_Boar (214309)
		end
	elseif e.timer == "scan" then
		local player_count = 0;
		local hate_list = e.self:GetHateList();
		
		if hate_list ~= nil then
			for mob in hate_list.entries do
				if mob.ent:IsClient() then 	--only want clients in this
					player_count = player_count + 1;
					if player_count > aggro_limit then
						mob.ent:Message(15,"You have been banished by Rallos Zek! His voice echoes in your mind, 'Do not attempt your foolish tricks against the warlord!'");
						mob.ent:CastToClient():MovePC(202,-280,-150,-152,384);	--banish to PoK
					end
				end
			end
		end
	end
end

function DepopPit()
	for _,spawns in pairs(pit_spawns) do
		local spawnpoint = eq.get_entity_list():GetSpawnByID(spawns);
		spawnpoint:Disable();
		spawnpoint:ForceDespawn();
	end
end

--Spawn Pit Adds
function spawn_adds(e)
	eq.zone_emote(7,"The corpses across the grounds of the arena begin to twitch and spasm as the will of the Warlord brings them to life.")
	local spawn_locs = {[1] = {564,191,-291,0}, [2] = {815,233,-291,0}, [3] = {881,15,-291,0}, [4] = {683,-129,-291,0}, [5] = {859,-154,-291,0}, [6] = {773,-266,-291,0}, [7] = {625,314,-290,0} };
	local rztw = eq.get_entity_list():GetMobByNpcTypeID(214298); 	--#Rallos_Zek_the_Warlord (214298)
	for n = 1,7 do
		add = eq.spawn2(eq.ChooseRandom(214308,214309),0,0,spawn_locs[n][1] + math.random(-15,15), spawn_locs[n][2] + math.random(-15,15), spawn_locs[n][3] + 5, spawn_locs[n][4]);	
		add:SetRunning(true);	
		add:CastToNPC():MoveTo(rztw:GetX(),rztw:GetY(),rztw:GetZ() - 25,rztw:GetHeading(),true);
		eq.set_timer("depop", 15 * 60 * 1000, add);
	end
end

function EventReset()
	eq.stop_all_timers();
	timer = 0;
	fail = false;
end


function EventWin(e)
	eq.stop_all_timers();	
	eq.spawn2(214306,0,0,689,0,-292,130);	--A_Planar_Projection
	eq.signal(214108,1,5 * 1000);	--signal #rztw_controller (214108) to unload encounter
end
	
function DepopEvent()
	local mob_list = {214296,214299,214300,214298,214307,214308,214309}	--TZ,VZ,FakeVZ,RZTW
	for _,mob in pairs(mob_list) do
		eq.depop_all(mob);
	end
end

	
