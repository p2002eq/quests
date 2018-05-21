--Bertoxx Encounter
--By Daeron


--room variables
local room_counter;
local room_timer = 60;  --in seconds from start of event to activate room spawns

--12 Triggers for Kings of Lxanvom (in order of spawn)
local darwol;
local feig;
local xhut;
local kavillis;
local raddi;
local wavadozzik;
local zandal;
local akkapan;
local four_kings;	--Meedo, Qezzin, Pzo, Bhaly (All triggered at once)

--spawnpoint tables
local center_spawnpoints = {368989,368990,368991,368992,368993,368994,368995}  --spawnpoint IDs for center spawns (7 total)
local south_spawnpoints	= {368996,368997,368998,368999,369000,369001}  --spawnpoint IDs for center spawns (6 total)
local north_spawnpoints	= {369002,369003,369004,369005,369006,369007}  --spawnpoint IDs for center spawns (6 total)
local west_spawnpoints = {369008,369009,369010,369011,369012,369013}  --spawnpoint IDs for center spawns (6 total
local east_spawnpoints = {369014,369015,369016,369017,369018,369019}  --spawnpoint IDs for center spawns (6 total)

--event counters
local spawn_counter;  --spawngroups staggered on event start (5 total spawn locations)
local king_counter;
local trash_counter;

--failure variables
local fail_timer = 2*60*60;	--2hr default
local fail = false;
local timer;

 
function event_encounter_load(e)
	--event variables
	EventReset();
	SpawnEvent();
	
	eq.zone_emote(7,"Crazed laughter is heard as you notice a foul creature standing before you. The creature then speaks saying, 'Violaters of the depths of Lxanvom shall pay with your lives!'  The foul minion of decay then begins chanting a dark ritual.  Deeper within the depths of the crypt more chanting can be heard.");
	
	eq.set_timer("Event_HB", 1*1000);
	eq.set_timer("start", 5 * 60 * 1000);	--default 5 min start
	eq.set_timer("fail", fail_timer * 1000);
	--registered events

	--Trash Kill counters
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200261, TrashCounter);		--#Knight_of_Decay (200261)
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200262, TrashCounter);		--#Priest_of_Decay (200262)
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200263, TrashCounter);		--#Necromancer_of_Decay (200263)
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200240, TrashCounter);		--#Elite_Knight_of_Decay (200240)
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200241, TrashCounter);		--#Elite_Necromancer_of_Decay (200241)
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200242, TrashCounter);		--#Elite_Priest_of_Decay (200242)
	
	--Kill Counters for Kings of Lxanvom
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200238, KingCounter);		--#Darwol_Adan (200238)
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200244, KingCounter);		--#Feig_Adan (200244)
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200255, KingCounter);		--#Xhut_Adan (200255)
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200247, KingCounter);		--#Kavilis_Adan (200247)
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200251, KingCounter);		--#Raddi_Adan (200251)
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200254, KingCounter);		--#Wavadozzik_Adan (200254)
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200256, KingCounter);		--#Zandal_Adan (200256)
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200233, KingCounter);		--#Akkapan_Adan (200233)
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200248, KingCounter);		--#Meedo_Adan (200248)	--four kings
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200250, KingCounter);		--#Qezzin_Adan (200250)	--four kings
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200249, KingCounter);		--#Pzo_Adan (200249)	--four kings
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200235, KingCounter);		--#Bhaly_Adan (200235)	--four kings
	--Bertoxx Killed
	eq.register_npc_event("Bertoxx_Event", Event.death_complete, 200260, EventWin);		--#Bertoxxulous (200260)

end

function EventReset()
	eq.stop_all_timers();
	king_counter = 0;
	trash_counter = 0;
	spawn_counter = 0;
	room_counter = 0;
	timer = 0;
	fail = false;
	darwol = false;
	feig = false;
	xhut = false;
	kavillis = false;
	raddi = false;
	wavadozzik = false;
	zandal = false;
	akkapan = false;
	four_kings = false;
end

function SpawnEvent()
	--spawn Summoners of Bertoxxolous
	local summoners = {[1] = {0,-64,-291,510}, [2] = {-243,0,-277,128}, [3] = {243,0,-277,384}, [4] = {-3,307,-244,259}, [5] = {-3,-307,-244,0} };
	for n = 1,5 do
		summoner = eq.spawn2(200015,0,0,unpack(summoners[n]));
	end
end

function event_timer(e)
	if e.timer == "Event_HB" then
		timer = timer + 1;	--tracks event timer in seconds
	elseif e.timer == "start" then 
		eq.stop_timer(e.timer);
		eq.set_timer("activate_spawns",1);	--initial timer is instant!
	elseif e.timer == "activate_spawns" then
		eq.stop_timer(e.timer);
		eq.set_timer("activate_spawns",60 * 1000);
		room_counter = room_counter + 1;
		if room_counter == 1 then
			eq.zone_emote(1,"A foul wind is felt carrying on it the stench of death and decay.  Suddenly a thunderous bang is heard throughout the crypt and then these words, 'Great soldiers of decay you are summoned forth to do battle with these infidels!'  All around the crypt echoes of footsteps and shuffling feet are heard.");
			activate_spawnpoints(center_spawnpoints);
		elseif room_counter == 2 then
			activate_spawnpoints(west_spawnpoints);
			activate_spawnpoints(east_spawnpoints);
		elseif room_counter == 3 then
			eq.stop_timer(e.timer);
			activate_spawnpoints(north_spawnpoints);
			activate_spawnpoints(south_spawnpoints);
		end
	elseif e.timer == "fail" then
			eq.stop_all_timers();
			DepopEvent();
			--Add fail emote?
			eq.signal(200041,1);	--signal #bert_unloader (200041) to unload encounter
	end
end

function activate_spawnpoints(spawn_table)
	for _,spawns in pairs(spawn_table) do
		spawnpoint = eq.get_entity_list():GetSpawnByID(spawns);
		spawnpoint:Enable();
		spawnpoint:Repop(1);
	end
end

function deactivate_spawnpoints(spawn_table)
	for _,spawns in pairs(spawn_table) do
		local spawnpoint = eq.get_entity_list():GetSpawnByID(spawns);
		spawnpoint:Disable();
		spawnpoint:ForceDespawn();
	end
end

function KingCounter()
	king_counter = king_counter + 1;
	eq.GM_Message(15,tostring("King counter is: " .. king_counter .. "/12"));	--debug/monitor progress
	if king_counter == 12 then
		eq.zone_emote(7,"A sinister vision enters your mind of a faceless one handsome yet dead and decaying. The vision then shifts to that of a torn bestial creature and a loud shout is heard, 'Defilers death comes for you today!'");
		eq.spawn2(200260,0,0,-45,0,-289,384);	--#Bertoxxulous (200260)
	end
end

function TrashCounter()
	trash_counter = trash_counter + 1;
	eq.GM_Message(15,tostring("Trash counter is: " .. trash_counter .. " (Timer: " .. tostring(timer) .. ")"));		--debug/monitor progress
	
	--King Spawn Locations
	--North Crypt: {-3,290,-244,0},			
	--South Crypt: {-3,-290,-244,127}	
	--West Crypt: {200,0,-270,192}	
	--East Crypt: {-200,0,-270,64}
	
	if trash_counter > 50 --[[and timer > 300]] and not darwol then		--5 minutes in event
		darwol = true;
		eq.zone_emote(7,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, Darwol Adan, your master has need of you!' A bestial squeak thunders through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
		eq.unique_spawn(200238,0,0,-3,290,-244,0)	--#Darwol_Adan (200238)	North Crypt
	elseif trash_counter > 60 and timer > 600 and not feig then	--10 minutes in event
		feig = true;
		eq.zone_emote(7,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, Feig Adan, your master has need of you!' A bestial squeak thunders through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
		eq.unique_spawn(200244,0,0,-200,0,-270,128)	--#Feig_Adan (200244) East Crypt
	elseif trash_counter > 70 and timer > 900 and not xhut then	--15 minutes in event
		xhut = true;
		eq.zone_emote(7,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, Xhut Adan, your master has need of you!' A dark vision flashes through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
		eq.unique_spawn(200255,0,0,-3,-290,-244,254)	--#Xhut_Adan (200255) South Crypt
	elseif trash_counter > 80 and timer > 1200 and not kavillis then	--20 minutes in event
		kavillis = true;
		eq.zone_emote(7,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, Kavilis Adan, your master has need of you!' A faint buzzing is heard through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
		eq.unique_spawn(200247,0,0,200,0,-270,384)	--#Kavilis_Adan (200247) West Crypt
	elseif trash_counter > 110 and timer > 1500 and not raddi then	--25 minutes in event
		raddi = true;
		eq.zone_emote(7,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom,  Raddi Adan, your master has need of you!' A wailing cry echoes through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
		eq.unique_spawn(200251,0,0,-3,-290,-244,254)	--#Raddi_Adan (200251) South Crypt
	elseif trash_counter > 120 and timer > 1800 and not wavadozzik then	--30 minutes in event
		wavadozzik = true;
		eq.zone_emote(7,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, Wavadozzik Adan, your master has need of you!' Chittering is heard through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
		eq.unique_spawn(200254,0,0,-200,0,-270,128)	--#Wavadozzik_Adan (200254)	East Crypt
	elseif trash_counter > 130 and timer > 2100 and not zandal then	--35 minutes in event
		zandal = true;
		eq.zone_emote(7,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, Zandal Adan, your master has need of you!' Chittering is heard through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
		eq.unique_spawn(200256,0,0,-3,290,-244,0)	--#Zandal_Adan (200256) North Crypt
	elseif trash_counter > 140 and timer > 2400 and not akkapan then	--40 minutes in event
		akkapan = true;
		eq.zone_emote(7,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, Akkapan Adan, your master has need of you!' A maddened whispering is heard through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
		eq.unique_spawn(200233,0,0,200,0,-270,384)	--#Akkapan_Adan (200233) West Crypt
	elseif trash_counter > 180 and timer > 2700 and not four_kings and king_counter == 8 then	--45 minutes in event
		four_kings = true;
		eq.zone_emote(7,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you the last corrupted Kings of Lxanvom. Meedo Adan! Qezzin Adan! Pzo Adan! Bhaly Adan! Your master has need of you!' Four separate howls of rage and despair echo throughout the lower depths of the crypt as four foul fiends of Bertoxxulous are summoned forth.");
		eq.unique_spawn(200249,0,0,-3,-290,-244,254)	--#Pzo_Adan (200249) South Crypt
		eq.unique_spawn(200248,0,0,-3,290,-244,0)	--#Meedo_Adan (200248) North Crypt
		eq.unique_spawn(200235,0,0,200,0,-270,384)	--#Bhaly_Adan (200235) West Crypt
		eq.unique_spawn(200250,0,0,-200,0,-270,128)	--#Qezzin_Adan (200250)	East Crypt
	end
end

function EventWin(e)
	eq.stop_all_timers();
	DepopEvent();
	eq.zone_emote(7,"A nimbus of light floods throughs the crypt in one magnificent wave as an earth shattering howl is heard.  The bringer of plagues, lord of all disease and decay, Bertoxxulous has been defeated. Suddenly an urgent whisper fills your head simply saying, 'The Torch of Lxanvom shall burn bright again.  Freedom is now ours, for that we thank you.'");
	eq.spawn2(205157,0,0,-45,0,-289,384);	--A_Planar_Projection
	eq.update_spawn_timer(360643,259200000 + math.random(-43200000,43200000));	--Set Spectre of Corruption respawn timer to 3 days +/- 12 hrs on win
	eq.signal(200041,1);	--signal #bert_unloader (200041) to unload encounter
end
	
function DepopEvent()
	local mob_list = {200015,200260,200238,200244,200255,200247,200251,200254,200256,200233,200249,200248,200235,200250}	--Summoner of Bertoxx (200015), Bertoxx(200260) & 12 Kings if up
	for _,mob in pairs(mob_list) do
		eq.depop_all(mob);
	end
	--despawn event mobs and disable spawns
	deactivate_spawnpoints(center_spawnpoints);
	deactivate_spawnpoints(west_spawnpoints);
	deactivate_spawnpoints(east_spawnpoints);
	deactivate_spawnpoints(north_spawnpoints);
	deactivate_spawnpoints(south_spawnpoints);
end

	
