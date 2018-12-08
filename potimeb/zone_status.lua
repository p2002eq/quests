-- NPC ID 223097
-- initialize variables global to this NPC
-- Original PoTimeB scripts from PEQ
-- Modified by Daeron for P2002

local current_phase = "Phase0";
local event_started = 0;
local event_counter = 0;
local instance_id = 0;
local qglobals = {};
local player_limit;
local echo = false;
local timer_echo = false;
local p1_started = false;

function event_spawn(e)
	ResetVariables();
	-- get the zone instance id
	instance_id = eq.get_zone_instance_id();
	-- turn off all the spawn conditions
	ResetSpawnConditions();
	-- load the current quest globals
	qglobals = eq.get_qglobals();
	-- grab the entity list so we can unlock doors if needed.
	local entity_list = eq.get_entity_list();
	
	-- if there is no phase_bit qglobal for this instance, create one
	if (qglobals[instance_id.."_potimeb_phase_bit"] == nil) then
		eq.set_global(instance_id.."_potimeb_phase_bit","0",7,"H132");
	end
	
	-- then check the value to decide what to pop - should reset to Phase 1 unless zone crash
	if ((qglobals[instance_id.."_potimeb_status"] == nil) or (qglobals[instance_id.."_potimeb_status"] == "Phase0") or (qglobals[instance_id.."_potimeb_status"] == "Phase1") 
		 or (qglobals[instance_id.."_potimeb_status"] == "Lockout")) then
		-- just in case the instance ID gets reused before this one expires, make sure to set phase_bit to 0
		eq.set_global(instance_id.."_potimeb_phase_bit","0",7,"H132");
		-- Spawn phase 1
		eq.spawn2(223169,0,0,13.5,1632.4,492.3,0); -- earth trigger
		eq.spawn2(223170,0,0,10.1,1350,492.6,0); -- air trigger
		eq.spawn2(223171,0,0,18.0,1107,492.2,0); -- undead trigger
		eq.spawn2(223172,0,0,11.5,857,492.5,0); -- water trigger
		eq.spawn2(223173,0,0,13.2,574.2,492.3,0); -- fire trigger
	elseif (qglobals[instance_id.."_potimeb_status"] == "Phase2") then
		UpdateFailTimer(60);
		current_phase = "Phase2";
		-- send signal to flavor text NPC
		eq.signal(223227,2);
		-- spawn phase 2 controller
		eq.unique_spawn(223242,0,0,190,1070,494,0); --phase_two_controller (223242)
	elseif (qglobals[instance_id.."_potimeb_status"] == "Phase3") then
		UpdateFailTimer(75);
		current_phase = "Phase3";
		-- send signal to flavor text NPC
		eq.signal(223227,3);
		-- begin Phase 3
		ControlPhaseThree();
	elseif (qglobals[instance_id.."_potimeb_status"] == "Phase4") then
		UpdateFailTimer(240);
		current_phase = "Phase4";
		-- send signal to flavor text NPC
		eq.signal(223227,4);
		SpawnPhaseFour();
	elseif (qglobals[instance_id.."_potimeb_status"] == "Phase5") then
		UpdateFailTimer(240);
		current_phase = "Phase5";
		-- send signal to flavor text NPC
		eq.signal(223227,5);
		SpawnPhaseFive();
	elseif (qglobals[instance_id.."_potimeb_status"] == "Phase6") then
		UpdateFailTimer(120);
		current_phase = "Phase6";
		-- send signal to flavor text NPC
		eq.signal(223227,6);
		-- spawn Quarm
		eq.spawn2(223201,0,0,-401,-1106,32.5,132);
		-- spawn #A_Servitor_of_Peace
		eq.spawn2(223101,0,0,244,-1106,-1.125,194.0625);
		-- spawn untargetable Zebuxoruk's Cage
		eq.spawn2(223228,0,0,-579,-1119,60.625,0);
	end
end

function event_signal(e)
	qglobals = eq.get_qglobals();
	instance_id = eq.get_zone_instance_id();
	eq.GM_Message(13,string.format("signal[%s]! - qglobal [%s]", e.signal,tostring(qglobals[instance_id.."_potimeb_status"])));	--debug
	-- grab the entity_list
	local entity_list = eq.get_entity_list();
	-- signal 1 comes from the phase 1 trigger mobs
	if (e.signal == 1 and not p1_started) then
		p1_started = true;
		-- npc global for status tracking.
		current_phase = "Phase1";
		-- send signal to flavor text NPC
		eq.signal(223227,1);
		UpdateFailTimer(60);
	-- signal 2 comes from the mobs in the final wave of each phase 1 event
	elseif (e.signal == 2 and qglobals[instance_id.."_potimeb_status"] == "Phase1") then
		-- check that all 5 phase 1 events are down.
		event_counter = event_counter + 1;
		eq.GM_Message(13,string.format("event counter [%s]", tostring(event_counter)));	--debug
		if (event_counter == 5) then
			-- reset counter for later use
			event_counter = 0;
			
			if qglobals[instance_id .. "_potimeb_Phase2_lockout"] == nil then
				current_phase = "Phase2";
				-- add 1 hour to the fail timer
				UpdateFailTimer(60);
				-- spawn phase 2 mobs
				eq.unique_spawn(223242,0,0,190,1070,494,0); --phase_two_controller (223242)
				-- send signal to flavor text NPC
				eq.signal(223227,2);
			elseif qglobals[instance_id .. "_potimeb_Phase3_lockout"] == nil then
				current_phase = "Phase2"
				ControlPhaseTwo();
				eq.signal(223227,99);
			elseif qglobals[instance_id .. "_potimeb_Phase4_lockout"] == nil then
				current_phase = "Phase3.9"
				event_counter = 1;
				eq.signal(223097,4);
				eq.signal(223227,99);
			elseif qglobals[instance_id .. "_potimeb_Phase5_lockout"] == nil then
				event_counter = 3;
				eq.signal(223097,5);
				eq.signal(223227,99);
			elseif qglobals[instance_id .. "_potimeb_Phase6_lockout"] == nil then
				event_counter = 3;
				eq.signal(223097,6);
				eq.signal(223227,99);
			end
		end
	-- signal 3 comes from the phase 2 mobs.
	elseif (e.signal == 3) then
		ControlPhaseTwo();
	-- signal 4 comes from the phase 3 mobs.
	elseif (e.signal == 4) then
		ControlPhaseThree();
	-- signal 5 comes from the phase 4 gods.
	elseif (e.signal == 5) then
		event_counter = event_counter + 1;
		if (event_counter == 4) then
			eq.set_global(instance_id.."_potimeb_phase_bit","0",7,"H13");
			current_phase = "Phase5";
			-- add 4 hours to the fail timer
			UpdateFailTimer(240);
			-- send signal to flavor text NPC
			eq.signal(223227,5);
			-- reset counter for later use
			event_counter = 0;
			-- spawn phase 5
			SpawnPhaseFive();
		end
	-- signal 6 comes from the phase 5 gods.
	elseif (e.signal == 6) then
		event_counter = event_counter + 1;
		if (event_counter == 4) then
			-- disable the spawn condition
			eq.spawn_condition("potimeb",instance_id,11,0);
			eq.spawn_condition("potimeb",instance_id,12,0);
			eq.spawn_condition("potimeb",instance_id,13,0);
			eq.spawn_condition("potimeb",instance_id,14,0);
			current_phase = "Phase6";
			-- add 2 hours to the fail timer
			UpdateFailTimer(120);
			-- send signal to flavor text NPC
			eq.signal(223227,6);
			-- reset counter for later use
			event_counter = 0;
			-- spawn Quarm
			eq.spawn2(223201,0,0,-401,-1106,32.5,185.625);
			-- spawn #A_Servitor_of_Peace
			eq.spawn2(223101,0,0,244,-1106,-1.125,194.0625);
			-- spawn untargetable Zebuxoruk's Cage
			eq.spawn2(223228,0,0,-579,-1119,60.625,0);
		end
	-- signal 7 comes from Quarm
	elseif (e.signal == 7) then
		current_phase = "QuarmDead";
		eq.stop_timer("event_hb");
		eq.set_timer("lockout", 50 * 60 * 1000);
	-- signal 8 comes from Druzzil_Ro
	elseif (e.signal == 8) then
		-- update the zone status
		eq.set_global(instance_id .. "_potimeb_Phase6_lockout","1",7,"H132");
		--eq.delete_global(instance_id.."_potimeb_progress");
		-- port everyone in the zone back to the PoK library top floor
		local client_list = entity_list:GetClientList();
		for c in client_list.entries do
			if ((c.valid) and (not c:GetGM())) then
				c:MovePCInstance(202,0,1015,20,392,264);
			end
		end
		ControllerDepop();
	--GM toggle reporting of player counts/event timers 
	elseif (e.signal == 98) then	
		if timer_echo then
			timer_echo = false;
			eq.GM_Message(14,"Event Timer Reports [OFF]")
		else
			timer_echo = true;
			eq.GM_Message(14,"Event Timer Reports [ON]")
		end
	elseif (e.signal == 99) then	
		if echo then
			echo = false;
			eq.GM_Message(14,"Player Count Reports [OFF]")
		else
			echo = true;
			eq.GM_Message(14,"Player Count Reports [ON]")
		end
	end
end

function ResetVariables()
	current_phase = "Phase0";
	event_started = 0;
	event_counter = 0;
	instance_id = 0;
	echo = false;
	timer_echo = false;
	p1_started = false;
	total_time = 0;
end

function ResetSpawnConditions()
	-- reset all spawn conditions to 0 we want nothing up at zone boot or repop
	for i = 1, 14, 1 do
		eq.spawn_condition("potimeb",instance_id,i,0);
	end
end

function ControlPhaseTwo()
	if (current_phase == "Phase2") then
		current_phase = "Phase3";
		ControlPhaseThree();
		-- send signal to flavor text NPC
		eq.signal(223227,3);
		-- add 1 hour and 15 minutes to the fail timer
		UpdateFailTimer(75);
	end
end

function ControlPhaseThree()
	if (current_phase == "Phase3") then
		--spawn phase 3
		locs = {[1] = {1250,1085,360}, [2] = {1250,1135,360} };	-- destination x,y,z locs only
		-- set the spawn condition for the first wave
		eq.spawn_condition("potimeb",instance_id,2,1);
		-- spawn the untargetable version of the phase 3 named
		eq.spawn2(223010,0,0,1280,1010,359.38,390); -- A_Needletusk_Warboar
		eq.spawn2(223011,0,0,1280,1030,359.38,390); -- Deathbringer_Rianit
		eq.spawn2(223012,0,0,1260,1250,359.38,390); -- Sinrunal_Gorgedreal
		eq.spawn2(223013,0,0,1260,1270,359.38,390); -- Herlsoakian
		eq.spawn2(223014,0,0,1280,1210,359.38,390); -- Xerskel_Gerodnsal
		eq.spawn2(223015,0,0,1280,1190,359.38,390); -- Dersool_Fal`Giersnaol
		eq.spawn2(223016,0,0,1260,970,359.38,390); -- Xeroan_Xi`Geruonask
		eq.spawn2(223017,0,0,1260,950,359.38,390); -- Kraksmaal_Fir`Dethsin
		eq.spawn2(223018,0,0,1300,1070,359.38,390); -- Dreamwarp
		eq.spawn2(223019,0,0,1300,1090,359.38,390); -- Champion_of_Torment
		eq.spawn2(223020,0,0,1300,1130,359.38,390); -- Dark_Knight_of_Terris
		eq.spawn2(223021,0,0,1300,1150,359.38,390); -- Undead_Squad_Leader
		eq.spawn2(223022,0,0,1230,1330,359.38,350); -- A_Deadly_Warboar
		eq.spawn2(223023,0,0,1230,1310,359.38,350); -- Deathbringer_Skullsmash
		eq.spawn2(223008,0,0,1250,1135,359.5,384); -- A_Ferocious_Warboar
		eq.spawn2(223009,0,0,1250,1085,359.5,384); -- Deathbringer_Blackheart
		current_phase = "Phase3.1";
	elseif (current_phase == "Phase3.1") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.2";
			-- spawn phase 3 wave 2
			eq.spawn_condition("potimeb",instance_id,2,0);
			eq.clear_spawn_timers();
			eq.spawn_condition("potimeb",instance_id,3,1);
			-- depop untargetable and pop targetable versions
			BossChange(223017,223024,1);	-- Xeroan_Xi`Geruonask
			BossChange(223016,223025,2);  -- Kraksmaal_Fir`Dethsin
		end
	elseif (current_phase == "Phase3.2") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.3";
			-- spawn phase 3 wave 3
			eq.spawn_condition("potimeb",instance_id,3,0);
			eq.clear_spawn_timers();
			eq.spawn_condition("potimeb",instance_id,4,1);
			BossChange(223023,223031,1);	-- A_Deadly_Warboar
			BossChange(223022,223032,2); -- Deathbringer_Skullsmash	
		end
	elseif (current_phase == "Phase3.3") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.4";
			-- spawn phase 3 wave 4
			eq.spawn_condition("potimeb",instance_id,4,0);
			eq.clear_spawn_timers();
			eq.spawn_condition("potimeb",instance_id,5,1);
			BossChange(223012,223038,1); -- Sinrunal_Gorgedreal
			BossChange(223013,223037,2); -- Herlsoakian		
			end
	elseif (current_phase == "Phase3.4") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.5";
			-- spawn phase 3 wave 5
			eq.spawn_condition("potimeb",instance_id,5,0);
			eq.clear_spawn_timers();
			eq.spawn_condition("potimeb",instance_id,6,1);
			BossChange(223011,223046,1); -- Deathbringer_Rianit
			BossChange(223010,223047,2); -- A_Needletusk_Warboar
		end
	elseif (current_phase == "Phase3.5") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.6";
			-- spawn phase 3 wave 6
			eq.spawn_condition("potimeb",instance_id,6,0);
			eq.clear_spawn_timers();
			eq.spawn_condition("potimeb",instance_id,7,1);
			BossChange(223015,223050,1); -- Xerskel_Gerodnsal
			BossChange(223014,223051,2); -- Dersool_Fal`Giersnaol	
		end
	elseif (current_phase == "Phase3.6") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.7";
			-- spawn phase 3 wave 7
			eq.spawn_condition("potimeb",instance_id,7,0);
			eq.clear_spawn_timers();
			eq.spawn_condition("potimeb",instance_id,8,1);
			BossChange(223021,223057,1); -- Undead_Squad_Leader
			BossChange(223020,223058,2); -- Dark_Knight_of_Terris
		end
	elseif (current_phase == "Phase3.7") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.8";
			-- spawn phase 3 wave 8
			eq.spawn_condition("potimeb",instance_id,8,0);
			eq.clear_spawn_timers();
			eq.spawn_condition("potimeb",instance_id,9,1);
			BossChange(223019,223065,1); -- Champion_of_Torment
			BossChange(223018,223066,2); -- Dreamwarp
		end
	elseif (current_phase == "Phase3.8") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.9";
			-- turn off spawn condition for wave 8
			eq.spawn_condition("potimeb",instance_id,9,0);
			eq.clear_spawn_timers();
			-- spawn golems
			eq.spawn2(223073,0,0,1492,1110,374.1,391); -- Avatar_of_the_Elements
			eq.spawn2(223074,0,0,1563,1110,374.1,391); -- Supernatural_Guardian
		end
	elseif (current_phase == "Phase3.9") then
		event_counter = event_counter + 1;
		if (event_counter == 2) then
			event_counter = 0;
			current_phase = "Phase4";
			-- send signal to flavor text NPC
			eq.signal(223227,4);
			-- add 4 hours to the fail timer
			UpdateFailTimer(240);
			-- spawn phase 4
			SpawnPhaseFour();
		end
	end
end

function BossChange(mob_id,targetable_id,num)
	old_boss = eq.get_entity_list():GetMobByNpcTypeID(mob_id);
	boss = eq.unique_spawn(targetable_id,0,0,old_boss:GetX(),old_boss:GetY(),old_boss:GetZ(),385);
	boss:SetRunning(true);
	boss:CastToNPC():MoveTo(locs[num][1],locs[num][2],locs[num][3],385,true);
	old_boss:Depop(false);
end

function SpawnPhaseFour()
	-- update qglobals
	qglobals = eq.get_qglobals();
	event_counter = 0;
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	if (phase_bit == 15) then
		-- this a rare crash handling instance. extremely hard to make happen
		eq.set_global(instance_id.."_potimeb_phase_bit","0",7,"H13");
		eq.repop_zone();
	else
		if (bit.band(phase_bit, 1) == 0) then
			eq.spawn2(223075,0,0,-310,307,365,190); -- Terris Thule
		else
			event_counter = event_counter + 1;
		end
		if (bit.band(phase_bit, 2) == 0) then
			eq.spawn2(223076,0,0,-320,-316,358,65); -- Saryrn
		else
			event_counter = event_counter + 1;
		end
		if (bit.band(phase_bit, 4) == 0) then
			eq.spawn2(223077,0,0,405,-84,358,384); -- Tallon Zek
		else
			event_counter = event_counter + 1;
		end
		if (bit.band(phase_bit, 8) == 0) then
			eq.spawn2(223078,0,0,405,75,358,384); -- Vallon Zek
		else
			event_counter = event_counter + 1;
		end
	end
end

function SpawnPhaseFive()
	-- update qglobals
	qglobals = eq.get_qglobals();
	instance_id = eq.get_zone_instance_id();
	event_counter = 0;
	if (qglobals[instance_id .. "_potimeb_p5_bertox"] == nil) then
		eq.spawn2(223098,0,0,-299,-297,23.3,62); -- Fake Bertoxxulous
		eq.spawn_condition("potimeb",instance_id,14,1);	
	elseif (qglobals[instance_id .. "_potimeb_p5_bertox"] == "Active") then
		eq.spawn2(223142,0,0,-299,-297,23.3,62); -- Real Bertoxxulous
	else
		event_counter = event_counter + 1;
	end
	
	if (qglobals[instance_id .. "_potimeb_p5_cazic"] == nil) then
		eq.spawn2(223165,0,0,-257,255,6,203); -- Fake Cazic
		eq.spawn_condition("potimeb",instance_id,12,1);	
	elseif (qglobals[instance_id .. "_potimeb_p5_cazic"] == "Active") then
		eq.spawn2(223166,0,0,-257,255,6,203); -- Real Cazic
	else
		event_counter = event_counter + 1;
	end
	
	if (qglobals[instance_id .. "_potimeb_p5_inny"] == nil) then
		eq.spawn2(223000,0,0,303.3,306,13.3,323); -- Fake Innoruuk
		eq.spawn_condition("potimeb",instance_id,11,1);	
	elseif (qglobals[instance_id .. "_potimeb_p5_inny"] == "Active") then
		eq.spawn2(223167,0,0,303.3,306,13.3,323); -- Real Innoruuk
	else
		event_counter = event_counter + 1;
	end
	
	if (qglobals[instance_id .. "_potimeb_p5_rallos"] == nil) then
		eq.spawn2(223001,0,0,264,-279,18.75,435); -- Fake Rallos
		eq.spawn_condition("potimeb",instance_id,13,1);	
	elseif (qglobals[instance_id .. "_potimeb_p5_rallos"] == "Active") then
		eq.spawn2(223168,0,0,264,-279,18.75,435); -- Real Rallos
	else
		event_counter = event_counter + 1;
	end
end

function UpdateFailTimer(minutes_to_add)
	total_time = (total_time + minutes_to_add);	
	eq.stop_timer("player_check");
	eq.set_timer("player_check", 10 * 1000);
	eq.GM_Message(14,"fail_timer set to " .. (total_time) .. " minutes");	--debug
	eq.set_timer("event_hb",60000);
end

function event_timer(e)
	if (e.timer == "event_hb") then
		total_time = total_time - 1;
		
		--echo time
		if timer_echo then
			eq.GM_Message(15,string.format("Time Left: [%s mins]",total_time));
		end
		
		--check failure timer
		if total_time <= 0 then
			EventFailed();
			return;
		end
		
		
		--announce time remaining in hourly increments
		if ((total_time ~= nil and total_time > 0 and total_time % 60 == 0)) then
			if (total_time / 60 == 8) then
				hours_left = "eight hours";
			elseif (total_time / 60 == 7) then
				hours_left = "seven hours";
			elseif (total_time / 60 == 6) then
				hours_left = "six hours";
			elseif (total_time / 60 == 5) then
				hours_left = "five hours";
			elseif (total_time / 60 == 4) then
				hours_left = "four hours";
			elseif (total_time / 60 == 3) then
				hours_left = "three hours";
			elseif (total_time / 60 == 2) then
				hours_left = "two hours";
			elseif (total_time / 60 == 1) then
				hours_left = "one hour";
			end
			eq.zone_emote(7,string.format("In the distance, an hourglass appears, the grains of sand falling methodically into place.  As quickly as the image was formed, it dissipates.  You have %s left.",hours_left));
		end
	elseif (e.timer == "player_check") then
		qglobals = eq.get_qglobals();
		local player_list = eq.get_entity_list():GetClientList();
		local count = 0;
		local phase = qglobals[eq.get_zone_instance_id() .. "_potimeb_status"];
		
		if (phase == "Phase1") or (phase == "Phase2") then
			player_limit = 54;
		else
			player_limit = 72;
		end
		
		if(player_list ~= nil) then
			for pc in player_list.entries do
				if not pc:GetGM() then
					count = count + 1;
					if count > player_limit then 
						pc:MovePC(219,-37,-110,13,0);	--boot to Time A
					end
				end
			end
		end
		if echo then
			eq.GM_Message(2,string.format("Current player count: [%s/%s]", tostring(count), tostring(player_limit)));
		end
	elseif (e.timer == "lockout") then	--handles instance where Quarm killed but Zeb/Druzzil Ro script not completed
		eq.stop_timer(e.timer);
		eq.set_global(instance_id .. "_potimeb_Phase6_lockout","1",7,"H132");
		SetZoneLockout();
		-- port everyone in the zone back to PoTimeA
		local client_list = eq.get_entity_list():GetClientList();
		for c in client_list.entries do
			if ((c.valid) and (not c:GetGM())) then
				c:MovePCInstance(219,0,-37,-110,9,0);
			end
		end
		ControllerDepop();
	end
end

function ControllerDepop()
	--depop zone_status and zone_emoters with timers
	eq.depop_with_timer(223097);
	eq.depop_with_timer(223227);
	
	--set respawn based on 1 hr lockout + 5 sec delay
	respawn = 3600000 + 5000;
	eq.update_spawn_timer(371157,respawn);
	
	-- depop the rest of zone on event fail.
	eq.depop_zone(false);
end

function EventFailed()
	-- change the qglobal so zone status will not reset things if the zone reboots.
	SetZoneLockout();
	current_status = "Lockout";
	eq.zone_emote(7,"An hourglass appears in the distance, the few remaining sands trickling down.  As the last grain falls, multicolored lights erupt from it, surrounding you in a brilliant flash.")
	
	-- port everyone in the zone back to the PoTimeA 
	local client_list = eq.get_entity_list():GetClientList();
	for c in client_list.entries do
		if ((c.valid) and (not c:GetGM())) then
			c:MovePCInstance(219,0,-37,-110,9,0);
		end
	end
	ResetSpawnConditions();
	ControllerDepop();
end

function SetZoneLockout()
	eq.set_global(eq.get_zone_instance_id() .."_potimeb_status","Lockout",7,"M30");
end
	