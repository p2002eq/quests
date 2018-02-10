--Fennin_Ro, The Tyrant of Fire Encounter
--By Daeron

--mob tables
local phase1_mobs = {217418,217419,217420,217421,217422,217424};
local phase2_mobs = {217418,217419,217424,217426,217439,217440,217450};
local council_mobs = {217428,217429,217449,217453};


--failure variables
local fail_timer = 2*60*60;	--2hr default
local fail = false;
local timer;

local phase2;
local council;

 
function event_encounter_load(e)
	--event variables
	EventReset();
	Phase1Setup();
	
	eq.zone_emote(7,"The ground rumbles as the Guardian of Doomfire collapses to the ground dead. Then a loud booming voice is heard saying. 'Come little mortals! Feel the chaos of the fires that flame the dark rage. Test yourselves against the might of my armies!'");
	
	eq.set_timer("Event_HB", 1*1000);
	eq.set_timer("fail", fail_timer * 1000);
	--registered events

	--Phase 1 (trash + Chaosfiends)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217418, PhaseCheck);	--a_chaos_healer_of_flame (217418)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217419, PhaseCheck);	--a_dark_magus_of_flame (217419)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217420, PhaseCheck);	--a_doomfire_chaosfiend (217420)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217421, PhaseCheck);	--a_doomfire_darkfiend (217421)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217422, PhaseCheck);	--a_doomfire_ragefiend (217422)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217424, PhaseCheck);	--a_rage_reaver_of_flame (217424)
		
	
	--Phase 2  (Balrogs)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217426, PhaseCheck);		--#Azobian_the_Darklord
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217439, PhaseCheck);		--#Hebabbilys_the_Ragelord
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217440, PhaseCheck);		--#Javonn_the_Overlord
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217450, PhaseCheck);		--#Reaxnous_the_Chaoslord
	
	--Phase 3 (Council)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217428, CouncilCheck);		--#Chancellor_Kirtra (217428)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217429, CouncilCheck);		--#Chancellor_Traxom (217429)
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217449, CouncilCheck);		--#Omni_Magus_Crato
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217453, CouncilCheck);		--#Warlord_Prollaz

	--Fennin Killed
	eq.register_npc_event("Fennin_Event", Event.death_complete, 217436, EventWin);		--#Fennin_Ro,_The_Tyrant_of_Fire (217436)
end



function EventReset()
	eq.stop_all_timers();
	trash_counter = 0;
	balrog_counter = 0;
	council_counter = 0;
	timer = 0;
	fail = false;
	phase2 = false;
	council = false;
end

function Phase1Setup()
	--spawn 1 (Chaosfiend Cluster #1) - 6 spawn
	eq.spawn2(217424,0,0,-460,-1145,-205,62);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217418,0,0,-460,-1175,-205,62);	--a_chaos_healer_of_flame (217418)
	eq.spawn2(217424,0,0,-460,-1205,-205,62);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217420,0,0,-485,-1175,-205,62);	--a_doomfire_chaosfiend (217420)
	eq.spawn2(217419,0,0,-525,-1160,-205,62);	--a_dark_magus_of_flame (217419)
	eq.spawn2(217419,0,0,-525,-1190,-205,62);	--a_dark_magus_of_flame (217419)
	
	--spawn 2 (Chaosfiend Cluster #2) - 4 spawn
	eq.spawn2(217424,0,0,-465,-995,-170,127);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217424,0,0,-510,-995,-170,127);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217420,0,0,-485,-975,-170,127);	--a_doomfire_chaosfiend (217420)
	eq.spawn2(217418,0,0,-485,-945,-170,127);	--a_chaos_healer_of_flame (217418)
	
	--spawn 3 (Chaosfiend Cluster #3) - 5 spawn
	eq.spawn2(217424,0,0,-575,-945,-150,62);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217424,0,0,-575,-995,-150,62);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217420,0,0,-580,-970,-150,62);	--a_doomfire_chaosfiend (217420)
	eq.spawn2(217418,0,0,-615,-955,-150,62);	--a_chaos_healer_of_flame (217418)
	eq.spawn2(217419,0,0,-615,-985,-150,62);	--a_dark_magus_of_flame (217419)
	
	--spawn 4 (Darkfiend Cluster #1) - 4 spawn
	eq.spawn2(217424,0,0,-670,-1095,-145,16);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217424,0,0,-722,-1088,-149,16);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217421,0,0,-705,-1095,-150,16);	--a_doomfire_darkfiend (217421)
	eq.spawn2(217419,0,0,-705,-1120,-145,16);	--a_dark_magus_of_flame (217419)
	
	--spawn 5 (Darkfiend Cluster #2) - 4 spawn
	eq.spawn2(217424,0,0,-625,-1170,-122,227);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217418,0,0,-620,-1205,-120,227);	--a_chaos_healer_of_flame (217418)
	eq.spawn2(217421,0,0,-605,-1190,-120,227);	--a_doomfire_darkfiend (217421)
	eq.spawn2(217419,0,0,-575,-1190,-120,227);	--a_dark_magus_of_flame (217419)
	
	--spawn 6 (Darkfiend Cluster #3) - 4 spawn
	eq.spawn2(217424,0,0,-600,-1320,-120,16);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217421,0,0,-592,-1340,-122,16);	--a_doomfire_darkfiend (217421)
	eq.spawn2(217424,0,0,-560,-1340,-120,242);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217419,0,0,-590,-1375,-127,33);	--a_dark_magus_of_flame (217419)
	
	--spawn 7 (Ragefiend Cluster #1) - 4 spawn
	eq.spawn2(217424,0,0,-740,-1435,-150,35);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217422,0,0,-715,-1455,-150,35);	--a_doomfire_ragefiend (217422)
	eq.spawn2(217424,0,0,-690,-1480,-150,35);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217418,0,0,-750,-1490,-150,35);	--a_chaos_healer_of_flame (217418)
	
	--spawn 8 (Ragefiend Cluster #2) - 4 spawn
	eq.spawn2(217424,0,0,-580,-1615,-170,222);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217424,0,0,-545,-1640,-170,222);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217422,0,0,-515,-1610,-170,217);	--a_doomfire_ragefiend (217422)
	eq.spawn2(217419,0,0,-490,-1580,-170,200);	--a_dark_magus_of_flame (217419)
	
	--spawn 9 (Ragefiend Cluster #3) - 6 spawn
	eq.spawn2(217424,0,0,-800,-1645,-206,62);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217422,0,0,-850,-1645,-206,62);	--a_doomfire_ragefiend (217422)
	eq.spawn2(217424,0,0,-860,-1620,-206,62);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217424,0,0,-860,-1675,-206,62);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217418,0,0,-905,-1665,-206,62);	--a_chaos_healer_of_flame (217418)
	eq.spawn2(217419,0,0,-905,-1635,-206,62);	--a_dark_magus_of_flame (217419)
end

function Phase2Setup()
	eq.zone_emote(7,"Four enraged roars of fury echo from further down the bridge over the cacophany of an army waiting to hand out death. The powerful voice is then heard saying, 'Reaxnous, Azobian, Hebabbilys, and Javonn! Come destroy these intruders.'");

	--Phase 2 Spawns
	eq.spawn2(217424,0,0,-1220,-1550,-230,103);	--a_rage_reaver_of_flame (217424)
	eq.spawn2(217424,0,0,-1235,-1585,-230,86);
	eq.spawn2(217424,0,0,-1255,-1565,-225,101);
	eq.spawn2(217424,0,0,-1255,-1620,-225,68);
	eq.spawn2(217424,0,0,-1280,-1590,-225,100);
	eq.spawn2(217424,0,0,-1315,-1615,-225,73);
	eq.spawn2(217424,0,0,-1300,-1550,-195,103);
	
	eq.spawn2(217418,0,0,-1280,-1575,-205,92);	--a_chaos_healer_of_flame (217418)
	eq.spawn2(217418,0,0,-1300,-1605,-225,100);		
	eq.spawn2(217418,0,0,-1305,-1530,-195,100);
	eq.spawn2(217418,0,0,-1350,-1580,-195,100);
	eq.spawn2(217418,0,0,-1250,-1505,-195,100);
	
	eq.spawn2(217419,0,0,-1238,-1542,-215,103);	--a_dark_magus_of_flame (217419)
	eq.spawn2(217419,0,0,-1250,-1525,-200,103);
	eq.spawn2(217419,0,0,-1320,-1603,-220,103);
	eq.spawn2(217419,0,0,-1331,-1587,-210,103);
	
	--Phase 2 Named Balrogs		
	eq.spawn2(217450,0,0,-1290,-1570,-210,83);	--#Reaxnous_the_Chaoslord
	eq.spawn2(217426,0,0,-1280,-1500,-195,103);	--#Azobian_the_Darklord
	eq.spawn2(217439,0,0,-1350,-1550,-195,103);	--#Hebabbilys_the_Ragelord
	eq.spawn2(217440,0,0,-1320,-1505,-195,103);	--#Javonn_the_Overlord
end

function Phase3Setup()
	eq.zone_emote(7,"As the last of the army is defeated, visions of endless burning flames intrude into your mind.  Suddenly the visions end as a call comes from just ahead saying, 'Prepare to meet your end at the hands of the Council of Fire!'");

	--Phase 3 Council Spawns
	eq.spawn2(217428,0,0,-1555,-1125,-195,127);	--#Chancellor_Kirtra (217428)
	eq.spawn2(217429,0,0,-1450,-1120,-195,127);	--#Chancellor_Traxom (217429)
	eq.spawn2(217449,0,0,-1400,-920,-180,127);	--#Omni_Magus_Crato
	eq.spawn2(217453,0,0,-1600,-920,-180,127);	--#Warlord_Prollaz
end

function event_timer(e)
	if e.timer == "Event_HB" then
		timer = timer + 1;	--tracks event timer in seconds
	elseif e.timer == "fail" then
		eq.stop_all_timers();
		DepopEvent();
		GM_Message(15,"ENCOUNTER FAILED!") --debug
		eq.signal(217066,1);	--signal #fennin_unloader (217066) to unload encounter
	end
end

function PhaseCheck()
	GM_Message(18,"kill check");	--debug
	if not phase2 and not mob_check(phase1_mobs) then
		phase2 = true;
		Phase2Setup();
	elseif phase2 and not mob_check(phase2_mobs) then
		council = true;
		Phase3Setup();
	end
end

function CouncilCheck()
	GM_Message(18,"council kill check");	--debug
	if council and not mob_check(council_mobs) then
		eq.zone_emote(7,"A maddened call of endless fury erupts as a burning creature of pure destructions stands tall before you.  The creature then speaks in the loud booming voice of immense power saying, 'You are fools to have come this far. Prepare to tremble at the might of Doomfire!'");
		eq.spawn2(217436,0,0,-1500,-935,-170,122);		--#Fennin_Ro,_The_Tyrant_of_Fire (217436)
	end
end



function mob_check(mob_table)
	for n,npc_id in pairs (mob_table) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(npc_id) then
			return true;
		end
	end
	return false;
end

function EventWin(e)
	eq.stop_all_timers();
	DepopEvent();
	eq.zone_emote(7,"Loud cries of hopelessness echo throughout the burning lands. The creatures of Doomfire call out to their master, Fennin Ro the Tyrant of Fire, for his dead body now lies at the feet of the mighty adventurers.");
	eq.spawn2(217455,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ() - 15, e.self:GetHeading());	--#Essence_of_Fire (217455)
	eq.signal(217066,1);	--signal #fennin_unloader (217066) to unload encounter
end
	
function DepopEvent()	
	local mob_list = {217418,217419,217420,217421,217422,217424,217426,217439,217440,217450,217428,217429,217449,217453,217436};	
	for _,mob in pairs(mob_list) do
		eq.depop_all(mob);
	end
end

function GM_Message(color,text)			--DEBUGGING/MONITORING
	client_list = eq.get_entity_list():GetClientList();
	
	if client_list ~= nil then
		for client in client_list.entries do
			if client:GetGM() then
				client:Message(color,text);
			end
		end
	end
end

	