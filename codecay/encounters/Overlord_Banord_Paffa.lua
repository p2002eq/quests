--Encounter for #Overlord_Banord_Paffa (200259)
--By Daeron

--pusling spawnpoints
local spawnpoints = {360628,360630,360631,360613,360629};
local Paffa;

--wave variables
local waves = false;
local wave_counter = 0;
local wave_timer =  3*60;	--3 min default

--failure variables
local fail_timer = 10*60	--10 min default
local fail = false;

 
function event_encounter_load(e)
	--event variables
	EventReset();
	Paffa = eq.get_entity_list():GetMobByNpcTypeID(200020);
	Pusling_Check(true);
	eq.set_timer("Event_HB", 1);
	eq.set_timer("reset", fail_timer * 1000);
	--registered events
	eq.register_npc_event("Overlord_Banord_Paffa", Event.timer, 200020, WaveTimer);	--Banord_Paffa (200020) untargetable
	eq.register_npc_event("Overlord_Banord_Paffa", Event.timer, 200259, FailTimer);	--#Overlord_Banord_Paffa (200259)
	eq.register_npc_event("Overlord_Banord_Paffa", Event.death_complete, 200259, Win);		--#Overlord_Banord_Paffa (200259)

end

function Win()
	eq.local_emote({140,-433,60}, 7, 150, "The immense body collapses to the floor sending shockwaves through the ground as you have triumphed over this maniacal creature of death and decay.");
	eq.signal(200033,1);	--signal event trigger
	DepopPuslings();
end

function EventReset()
	eq.stop_all_timers();
	wave_counter = 0;
	waves = false;
	fail = false;
end

function event_timer(e)
	if e.timer == "Event_HB" then
		if not Pusling_Check(false) and not waves then
			eq.set_timer("wave_start", wave_timer * 1000, Paffa);
			waves = true;
			spawn_mobs(1);	--initial wave
		end
	elseif e.timer == "reset" then
		eq.stop_timer(e.timer);
		if not waves then	--event has been started
			eq.stop_all_timers();
			fail = true;
			DepopPuslings();
			RepopPuslings();
			eq.signal(200033,2);	--reset event
		end
	end
end

function WaveTimer(e)
	if e.timer == "wave_start" then
		wave_counter = wave_counter + 1;
		spawn_mobs(wave_counter);
	end
end

function FailTimer(e)
	if e.timer == "fail" and not eq.get_entity_list():GetMobByNpcTypeID(200259):IsEngaged() then
		fail = true;
		eq.stop_all_timers();
		RealPaffa:Depop();
		eq.get_entity_list():GetSpawnByID(360632):Repop(1)	--Repop Banord_Paffa (200020) untargetable
		DepopPuslings();
		RepopPuslings();
		eq.signal(200033,2);
	elseif e.timer == "fail" then
		eq.stop_timer(e.timer);
		eq.set_timer("fail", 1*1000, RealPaffa);
	end
end

function Pusling_Check(repop)
	for _,puslings in pairs(spawnpoints) do
	local pusling = eq.get_entity_list():GetSpawnByID(puslings);
		if pusling:NPCPointerValid() and not repop then
			return true;
		elseif not pusling:NPCPointerValid() and repop then
			pusling:Repop(1);
		end
	end
	return false;
end
		

function spawn_mobs(wave)
	if wave < 2 then
		eq.local_emote({140,-433,60}, 7, 150, "A crazed chant echoes through the room as Banord calls for more minions to attack.");
		for n = 1,4 do
			local pusling = eq.get_entity_list():GetSpawnByID(spawnpoints[n]);
			pusling:Repop(1);
		end
	elseif wave == 2 then
		eq.stop_timer("wave_timer", Paffa);
		for n = 1,5 do
			local pusling = eq.get_entity_list():GetSpawnByID(spawnpoints[n]);
			pusling:Repop(1);
		end
		RealPaffa = eq.unique_spawn(200259,0,0,140,-431,-70,220.3); --#Overlord_Banord_Paffa (200259)
		eq.depop_with_timer(200020);	-- despawn Banord_Paffa (200020) untargetable
		eq.local_emote({156,-440,-70}, 7, 150, "A loud and maddened scream of rage is heard as Banord prepares to attack.");
		eq.set_timer("fail", fail_timer * 1000, RealPaffa);	--will check for reset if boss is non-aggro after 10 min (would indicate group died)
	end
end	

function DepopPuslings()
	for _,spawns in pairs(spawnpoints) do
		local npc_list = eq.get_entity_list():GetNPCList();

		if(npc_list ~= nil) then
			for npc in npc_list.entries do
				if npc:GetSpawnPointID() == spawns then
					npc:Depop(true);
				end
			end
		end
	end
end

function RepopPuslings()
	for _,puslings in pairs(spawnpoints) do
		local pusling = eq.get_entity_list():GetSpawnByID(puslings);
		pusling:Repop(1);
	end
end
