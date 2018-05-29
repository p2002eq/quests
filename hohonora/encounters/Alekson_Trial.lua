--[[
Alekson Garn Trial (Virgins/Maidens)
By Daeron
]]

--room counter variables
local room1_counter;
local room2_counter;
local room3_counter;
local boss_counter;

--Boss Spawn Triggers
local Advocent;	--Room 1
local Halgoz;	--Room 2
local Freegan;	--Room 3

local mob_table = {211101,211111,211075,211079,211080,211081,211085,211095,211093,211116,211117,211118};
local fail = false;

 
function event_encounter_load(e)
	--event variables
	EventReset();

	eq.set_timer("event_HB", 1);
			
	--registered events
	--eq.register_npc_event("Alekson_Trial", Event.timer, 204039, Alekson_Timers);	
	eq.register_npc_event("Alekson_Trial", Event.signal,211072, Alekson_Signal);				--Alekson_trigger NPC
	eq.register_npc_event("Alekson_Trial", Event.death_complete, 211075, Room1Counter);		--a_crazed_norrathian (211075)
	eq.register_npc_event("Alekson_Trial", Event.death_complete, 211079, Room2Counter);		--a_recuso_drifter (211079)
	eq.register_npc_event("Alekson_Trial", Event.death_complete, 211080, Room2Counter);		--a_recuso_straggler (211080)
	eq.register_npc_event("Alekson_Trial", Event.death_complete, 211081, Room2Counter);		--a_recuso_vagrant (211081)
	eq.register_npc_event("Alekson_Trial", Event.death_complete, 211116, Room3Counter);		--#a_recuso_drifter (211116)
	eq.register_npc_event("Alekson_Trial", Event.death_complete, 211117, Room3Counter);		--#a_recuso_straggler (211117)
	eq.register_npc_event("Alekson_Trial", Event.death_complete, 211118, Room3Counter);		--#a_recuso_vagrant (211118)
	eq.register_npc_event("Alekson_Trial", Event.death_complete, 211085, BossCounter);		--#Advocent_Joran (211085)
	eq.register_npc_event("Alekson_Trial", Event.death_complete, 211095, BossCounter);		--#Halgoz_Rellinic (211095)
	eq.register_npc_event("Alekson_Trial", Event.death_complete, 211093, BossCounter);		--#Freegan_Haun (211093)
	eq.register_npc_event("Alekson_Trial", Event.death_complete, 211114, SpawnEvent);		--#A_Custodian_of_Marr (211114)

end

function EventReset()
	room1_counter = 0;
	room2_counter = 0;
	room3_counter = 0;
	boss_counter = 0;
	Advocent = false;	
	Halgoz = false;	
	Freegan = false;	
	fail = false;
end

function SpawnEvent(e)
	--SPAWN MAIDENS:	
	eq.spawn2(211101,0,0,-3180,-1715,-114,260);	--Miranda_Climmes (211101)	ROOM 2		
	eq.spawn2(211111,0,0,-3159,-1129,-114,220)	--Ydira_Merok (211111)	ROOM 3

	--MOBS:
	--ROOM 1 TRASH
	eq.spawn2(211075,0,0,-2739,-1736,-113,128);		--a_crazed_norrathian (211075)
	eq.spawn2(211075,0,0,-2739,-1714,-113,128);
	eq.spawn2(211075,0,0,-2582,-1872,-113,41.2);
	eq.spawn2(211075,0,0,-2667,-1724,-113,128);
	eq.spawn2(211075,0,0,-2588,-1600,-113,41.2);

	--ROOM 2 TRASH									
	eq.spawn2(eq.ChooseRandom(211079,211080,211081),0,0,-3318,-1841,-113,26);		--a_recuso_drifter (211079)	--a_recuso_straggler (211080) 	--a_recuso_vagrant (211081)
	eq.spawn2(eq.ChooseRandom(211079,211080,211081),0,0,-3319,-1725,-113,130);
	eq.spawn2(eq.ChooseRandom(211079,211080,211081),0,0,-3299,-1621,-113,41.2);
	eq.spawn2(eq.ChooseRandom(211079,211080,211081),0,0,-3034,-1636,-113,346);
	eq.spawn2(eq.ChooseRandom(211079,211080,211081),0,0,-3034,-1816,-113,316); -- needs_heading_validation

	--ROOM 3 TRASH

	eq.spawn2(eq.ChooseRandom(211116,211117,211118),0,0,-3293,-1027,-113,172);		--#a_recuso_drifter (211116), --#a_recuso_straggler (211117) --#a_recuso_vagrant (211118)
	eq.spawn2(eq.ChooseRandom(211116,211117,211118),0,0,-3027,-1035,-113,130);	
	eq.spawn2(eq.ChooseRandom(211116,211117,211118),0,0,-3035,-1229,-113,434);
	eq.spawn2(eq.ChooseRandom(211116,211117,211118),0,0,-3303,-1229,-113,346);
	eq.spawn2(eq.ChooseRandom(211116,211117,211118),0,0,-3168,-1028,-113,316); -- needs_heading_validation
end

function Room1Counter(e)
	room1_counter = room1_counter + 1;
end		

function Room2Counter(e)
	room2_counter = room2_counter + 1;
end		

function Room3Counter(e)
	room3_counter = room3_counter + 1;
end		

function BossCounter(e)
	boss_counter = boss_counter + 1;
	if boss_counter == 3 then
		eq.stop_all_timers();
		eq.depop_all(211101);	--depop maidens
		eq.depop_all(211111);
		eq.spawn2(211061,0,0,-2330,-1724,-117,391.6)		--#Alekson_Garn (flag version)
		eq.update_spawn_timer(361021,259200000 + math.random(-43200000,43200000));	--Set Alekson Garn respawn timer to 3 days +/- 12 hrs on win
		EventReset();
	end
end

function event_timer(e)
	if e.timer == "event_HB" then
		--check kill counters to determine boss spawns
		if room1_counter == 5 and not Advocent then
			Advocent = true;
			eq.spawn2(211085,0,0,-2494 + math.random(-75,75), -1731 + math.random(-75,75), -112,260);	--#Advocent_Joran (211085)
		elseif room2_counter == 5 and not Halgoz then
			Halgoz = true;
			eq.spawn2(211095,0,0,-3169 + math.random(-75,75), -1751 + math.random(-75,75), -112,152.4);	--#Halgoz_Rellinic (211095)
		elseif room3_counter == 5 and not Freegan then
			Freegan = true;
			eq.spawn2(211093,0,0,-3179 + math.random(-75,75), -1127 + math.random(-75,75), -112,306);	--#Freegan_Haun (211093)
		end
	end
end

function Alekson_Signal(e)
	if e.signal == 1 and not fail then
		fail = true;
		eq.local_emote({-3167,-1129,-114},7,1250, "A woman screams in anguish as she's forcibly taken away by a band of crazed norrathians.")
		for _,mob in pairs(mob_table) do
			eq.depop_all(mob);
		end
	end
end

function event_encounter_unload(e)
end

