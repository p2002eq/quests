--Mud Ring (Monstrous Mudwalker)
--By Daeron

--mob tables
local event_mobs = {218371,218360,218349,218358,218355};
local trigger_counter;
local target;
local wave;

--failure variables
local fail_timer = 3 * 60 * 60;	--3 hr default
local reset_timer = 5 * 60;		--5 min default  (timer for boss reset)
local boss_depop = 50 * 60;		--50 min default for boss to depop


function EventReset()
	eq.stop_all_timers();
	wave = 0;
	final_boss = false;
end

function Phase1(e)
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(218317) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(218018) then --confirms no Mudwalkers or Seekers are up
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,1000,"The last of the mud walkers has been slain. A loud roar is heard from the center of the muddite temple as the Sludge Lurker comes into being.");
		eq.spawn2(218371,0,0,341,83,72,0);	--#A_Sludge_Lurker (218371)
	end	
end

function SpawnGorgers(e) --for 4 spawn mobs 
	local spawn_locs = { [1] = {293,140,75,192}, [2] = {293,32,75,64}, [3] = {400,32,75,449}, [4] = {400,140,75,320} };

	for n = 1,4 do
		mob = eq.spawn2(218349,0,0,unpack(spawn_locs[n]));	--#A_Filth_Gorger (218349)
		mob:SetRunning(true);
		mob:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading(),true);
	end
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,1000,"More mud flies everywhere, coalescing into mud creatures gorged with filth.");
end

function SetHP(e)	--Sludge lurker HP events will decrease based on wave
	hp = {75,60,40,15}
	wave = wave + 1;
	
	if wave < 5 then
		eq.set_next_hp_event(hp[wave]);
	end
	
	if wave > 1 then
		e.self:SetHP(e.self:GetHP() * hp[wave-1] / 100);	--should set HP% to before last death
	end
end

function HPEvent(e)
	if ((wave == 1 and e.hp_event == 75) or (wave == 2 and e.hp_event == 60) or (wave == 3 and e.hp_event == 40) or (wave == 4 and e.hp_event == 15)) then
		spawn_mudlets(e);
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,1000,"Massive gobs of mud fly everywhere as the huge creature of mud explodes. The gobs of mud coalesce into smaller mud creatures.");
		eq.depop();
	end
end

function spawn_mudlets(e)	--triggered on death of first 4 waves of Sludge Lurkers
	for n = 1,10 do
		eq.spawn2(218360,0,0,e.self:GetX() + math.random(-15, 15), e.self:GetY() + math.random(-15,15), e.self:GetZ()-15,e.self:GetHeading());	--#A_Muck_Mudlet (218360)
	end
end

function LurkerCheck(e)	--death check on each mucklet to see if it can spawn next lurker
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(218360) and not final_boss then	--#A_Muck_Mudlet (218360)
		lurker = eq.spawn2(218371,0,0,341,83,72,0);	--#A_Sludge_Lurker (218371)
		lurker:SetRunning(true);
		lurker:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading(),true);
	end
end


function MudwalkerSpawn(e)	--check for spawn conditions on Filth Gorger's death
	x,y,z,h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
	local qglobals = eq.get_qglobals();
	local instance_id = eq.get_zone_instance_id();
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(218349) then
		eq.local_emote({x,y,z},7,1000,"The last of the filthy mud men fall to the ground motionless.  Suddenly a monstrous creature of mud forms from the remains of all the other mud men!");
		if qglobals[instance_id .. "_MudRing_PoEarthA"] == nil then
			BossSpawn(218358);	--#A_Monstrous_Mudwalker (218358)
			eq.set_global(instance_id .. "_MudRing_PoEarthA", "1",3,"D3");	--blowable spawn - setting flag regardless of death
		else
			BossSpawn(218355);	--#A_Merciless_Mudslinger (218355)
		end
	end
end

function EventCombat(e)
	if e.joined then	
		if e.self:GetNPCTypeID() == 218358 or e.self:GetNPCTypeID() == 218355 then --only final bosses memblur
			eq.set_timer("memblur",12 * 1000);
		end
	else
		e.self:SaveGuardSpot(true);	--will corpse camp
	end
end


function BossSpawn(boss_id)
	final_boss = true;
	boss = eq.unique_spawn(boss_id,0,0,341,83,72,0);
	boss:SetRunning(true);
	boss:CastToNPC():MoveTo(x,y,z,h,true);
	eq.set_timer("depop", boss_depop * 1000, boss);	--hard depop to kill boss
end

function BossTimer(e)
	if e.timer == "memblur" then
		if eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(),50) then	--check if player is within 50 units
			if math.random(100) <= 40 then e.self:WipeHateList() end  			--40% memblur chance
		elseif not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
		end
	elseif e.timer == "depop" then
		EndEvent();
	end
end

function SpawnAdds(e)
	if e.other:IsClient() or e.other:IsPet() then	--verify client or pet has died
		boss:Emote("pummels his victim into the earth dispersing mud everywhere. The gobs of mud coalesce into smaller mud creatures.")
		eq.spawn2(218360,0,0,e.self:GetX() + math.random(-15, 15), e.self:GetY() + math.random(-15,15), e.self:GetZ(),e.self:GetHeading());	--mudlets
		eq.spawn2(218360,0,0,e.self:GetX() + math.random(-15, 15), e.self:GetY() + math.random(-15,15), e.self:GetZ(),e.self:GetHeading());
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
	eq.signal(218392,2);	--mud_controller (218392) to unload encounter
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
	--Phase 1
	eq.register_npc_event("Mud_Event", Event.death_complete, 218317, Phase1);				--An_Earthen_Mudwalker (218317)
	
	--Phase 2
	eq.register_npc_event("Mud_Event", Event.spawn, 218371, SetHP);							--#A_Sludge_Lurker (218371)
	eq.register_npc_event("Mud_Event", Event.hp, 218371, HPEvent);							--#A_Sludge_Lurker (218371)
	eq.register_npc_event("Mud_Event", Event.death_complete, 218371, SpawnGorgers);			--#A_Sludge_Lurker (218371)
	eq.register_npc_event("Mud_Event", Event.death_complete, 218360, LurkerCheck);			--#A_Muck_Mudlet (218360)

	--Phase 3 ()
	eq.register_npc_event("Mud_Event", Event.death_complete, 218349, MudwalkerSpawn);		--#A_Filth_Gorger (218349)
	eq.register_npc_event("Mud_Event", Event.combat, 218349, EventCombat);					--#A_Filth_Gorger (218349)
	
	--A_Monstrous_Mudwalker (Final Phase)
	eq.register_npc_event("Mud_Event", Event.combat, 218358, EventCombat);					--#A_Monstrous_Mudwalker (218358)
	eq.register_npc_event("Mud_Event", Event.timer, 218358, BossTimer);						--#A_Monstrous_Mudwalker (218358)
	eq.register_npc_event("Mud_Event", Event.death_complete, 218358, EventWin);				--#A_Monstrous_Mudwalker (218358)
	eq.register_npc_event("Mud_Event", Event.slay, 218358, SpawnAdds);						--#A_Monstrous_Mudwalker (218358)

	
	--#A_Merciless_Mudslinger (218355) PH for Monstrous Mudwalker
	eq.register_npc_event("Mud_Event", Event.combat, 218355, EventCombat);					--#A_Merciless_Mudslinger (218355)
	eq.register_npc_event("Mud_Event", Event.timer, 218355, BossTimer);						--#A_Merciless_Mudslinger (218355)
	eq.register_npc_event("Mud_Event", Event.death_complete, 218355, EventWin);				--#A_Merciless_Mudslinger (218355)
end 
