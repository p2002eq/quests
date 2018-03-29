--Rhaliq Trell Trial (Villagers Trial)
--By Daeron


--villager mob listing
local villager_table ={	211074,		--a_barbarian_villager (211074)
						211082,		--a_woodelf_villager (211082)
						211078,		--a_human_villager (211078)
						211077,		--a_halfling_villager (211077)
						211076,		--a_halfelf_villager (211076)
						211122,		--a_dwarven_villager (211122)
						211123};	--a_gnome_villager(211123)


--enemy mob listing
local enemy_table = {	211100,		--#Merken_Lysonn (211100)	
						211096, 	--#Herot_Terkins (211096)
						211112,		--#Zullkata_Reeps (211112)
						211099,		--#Maeryn_Malladry (211099)
						211102,		--#Mirezvakla_Ry`Ten (211102)
						211104,		--#Ruark_Barr (211104)
						211106,		--#Shott_Tarbs (211106)
						211108,		--#Trann_Berk (211108)
						211109,		--#Thullias_Rhidron (211109)
						211110,		--#Yarezka_Tri`Lok (211110)
						211094,		--#Granmuck_Reiga (211094)
						211092};	--#Fligg_Starp (211092)

local enemy_counter;
local villager_counter;
local fail = false;

 
function event_encounter_load(e)
	--event variables
	EventReset()
		
	--registered events
	--Villager (Signaled on failure)
	eq.register_npc_event("Rhaliq_Trial", Event.signal, 211123, VillagerSignal);	--a_gnome_villager(211123)
	--Enemies
	eq.register_npc_event("Rhaliq_Trial", Event.death_complete, 211100, EnemyCounter);		--#Merken_Lysonn (211100)
	eq.register_npc_event("Rhaliq_Trial", Event.death_complete, 211099, EnemyCounter);		--#Maeryn_Malladry (211099)
	eq.register_npc_event("Rhaliq_Trial", Event.death_complete, 211102, EnemyCounter);		--#Mirezvakla_Ry`Ten (211102)
	eq.register_npc_event("Rhaliq_Trial", Event.death_complete, 211104, EnemyCounter);		--#Ruark_Barr (211104)
	eq.register_npc_event("Rhaliq_Trial", Event.death_complete, 211106, EnemyCounter);		--#Shott_Tarbs (211106)
	eq.register_npc_event("Rhaliq_Trial", Event.death_complete, 211108, EnemyCounter);		--#Trann_Berk (211108)
	eq.register_npc_event("Rhaliq_Trial", Event.death_complete, 211109, EnemyCounter);		--#Thullias_Rhidron (211109)
	eq.register_npc_event("Rhaliq_Trial", Event.death_complete, 211110, EnemyCounter);		--#Yarezka_Tri`Lok (211110)
	eq.register_npc_event("Rhaliq_Trial", Event.death_complete, 211112, EnemyCounter);		--#Zullkata_Reeps (211112)
	eq.register_npc_event("Rhaliq_Trial", Event.death_complete, 211096, EnemyCounter);		--#Herot_Terkins (211096)
	eq.register_npc_event("Rhaliq_Trial", Event.death_complete, 211094, EnemyCounter);		--#Granmuck_Reiga (211094)	
	eq.register_npc_event("Rhaliq_Trial", Event.death_complete, 211092, EnemyCounter);		--#Fligg_Starp (211092)
	--Encounter Trigger
	eq.register_npc_event("Rhaliq_Trial", Event.death_complete, 211115, SpawnEvent);		--#A_Custodian_of_Marr	

end

function SpawnEvent(e)
	--VILLAGERS:
	eq.spawn2(211122,0,0,592,1292,-116,128);		--a_dwarven_villager (211122)
	eq.spawn2(211077,0,0,592,1341,-116,128);		--a_halfling_villager (211077)
	eq.spawn2(211078,0,0,592,1400,-116,128);		--a_human_villager (211078)
	eq.spawn2(211082,0,0,656,1341,-116,128);		--a_woodelf_villager (211082)
	eq.spawn2(211074,0,0,656,1400,-116,128);		--a_barbarian_villager (211074)
	eq.spawn2(211076,0,0,592,1454,-116,128);		--a_halfelf_villager (211076)
	eq.spawn2(211123,0,0,592,1502,-116,128);		--a_gnome_villager(211123)

	--ENEMY MOBS:
	--ROOM 1 MOBS
	eq.spawn2(211100,0,0,785,1374,-115,384);		--#Merken_Lysonn (211100)
	
	--ROOM 2 MOBS (pathing grid: 50)
	eq.spawn2(211096,50,0,1294 + math.random(-200,200),1370 + math.random(-200,200),-115,0);	--#Herot_Terkins (211096)
	eq.spawn2(211112,50,0,1294 + math.random(-200,200),1370 + math.random(-200,200),-115,0);	--#Zullkata_Reeps (211112)
	eq.spawn2(211109,50,0,1294 + math.random(-200,200),1370 + math.random(-200,200),-115,0);	--#Thullias_Rhidron (211109)
	eq.spawn2(211099,50,0,1294 + math.random(-200,200),1370 + math.random(-200,200),-115,0);	--#Maeryn_Malladry (211099)
	eq.spawn2(211110,50,0,1294 + math.random(-200,200),1370 + math.random(-200,200),-115,0);	--#Yarezka_Tri`Lok (211110)
	
	--ROOM 3 MOBS (pathing grid: 51)
	eq.spawn2(211102,51,0,1294 + math.random(-200,200),1979 + math.random(-200,200),-115,0);	--#Mirezvakla_Ry`Ten (211102)
	eq.spawn2(211104,51,0,1294 + math.random(-200,200),1979 + math.random(-200,200),-115,0);	--#Ruark_Barr (211104)
	eq.spawn2(211106,51,0,1294 + math.random(-200,200),1979 + math.random(-200,200),-115,0);	--#Shott_Tarbs (211106)
	eq.spawn2(211092,51,0,1294 + math.random(-200,200),1979 + math.random(-200,200),-115,0);	--#Fligg_Starp (211092)
	eq.spawn2(211094,51,0,1294 + math.random(-200,200),1979 + math.random(-200,200),-115,0);	--#Granmuck_Reiga (211094)
	eq.spawn2(211108,51,0,1294 + math.random(-200,200),1979 + math.random(-200,200),-115,0); 	--#Trann_Berk (211108)
end

function EventReset()
	enemy_counter = 0;
	villager_counter = 0;
	fail = false;
end

function EnemyCounter(e)
	enemy_counter = enemy_counter + 1;
	if enemy_counter == 12 then
		Depop(villager_table);
		eq.spawn2(211052,0,0,456,1374,-117,130.6)		--#Rhaliq_Trell (flag version)
		eq.update_spawn_timer(360971,259200000 + math.random(-43200000,43200000));	--Set Rhaliq Trell respawn timer to 3 days +/- 12 hrs on win
		EventReset();
	end
end

function VillagerSignal(e)
	if e.signal == 1 then		--Event failed
		Depop(enemy_table);		--depop all event enemies
		Depop(villager_table);	--depop all villagers
		EventReset();
	end
end

function Depop(mob_table)
	for _,mob in pairs(mob_table) do
		eq.depop_all(mob);
	end
end
