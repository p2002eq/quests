--Rathe Council Encounter 
--By Daeron

--#A_Rathe_Councilman (222141) -- MEZZABLE VERSION -- spawnpoints (369104,369107,369097,369098,369100,369102)
--A_Rathe_Councilman (222140) -- NON-MEZZABLE VERSION -- spawnpoints (369103,369105,369106,369108,369099,369101)

local spawnpoints = {369104,369107,369097,369098,369100,369102,369103,369105,369106,369108,369099,369101};	--rathe council spawnpoints
local fallen;

--failure variables
local fail_timer = 3 * 60 * 60;	--3 hr default
local boss_depop = 50 * 60;	--50 min default for boss to depop
local council_timer = 345;	--approx 5.7min (345 seconds) to kill all 12 council members before respawn (verified on live)

function EventReset()
	fallen = false;	--flag variable to start timer once a council member is killed
end

function GetGlobals()
	qglobals = eq.get_qglobals();
	instance_id = eq.get_zone_instance_id();
end

function CouncilCheck(e)
	GetGlobals();
	
	if not fallen then
		fallen = true;
		eq.set_timer("repop_check", council_timer * 1000,controller);
	end
	
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222140) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222141) and qglobals[instance_id .. "_AvatarOfEarth_PoEarthB"] == nil then
		eq.zone_emote(7,"The last of the council collapses, devoid of life. Twelve distinct voices chant, 'Time comes and time passes, for the stone is forever.  We call upon our collective power to defend our stronghold!'  When the chanting ceases, a deep throated primal scream echoes across Ragrax as the power of twelve is joined as one.  The Avatar of Earth has been summoned.");
		avatar  = eq.unique_spawn(222147,0,0,2052,400,-210,0);	--#Avatar_of_Earth (222147)
		eq.set_global(instance_id .. "_AvatarOfEarth_PoEarthB", "1",3,"D3");		--blowable spawn - setting flag regardless of death
		eq.stop_timer("repop_check",controller);
		eq.stop_all_timers();	--stops fail timer and repop check timers
		eq.set_timer("depop", boss_depop * 1000, avatar);	--hard depop to kill boss
		SetRespawnTimers();
	end	
end

function CouncilRepop(e)
	if e.timer == "repop_check" then
		eq.stop_timer(e.timer);
		fallen = false;

		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222147) then
			for k,v in pairs(spawnpoints) do
				spawn = eq.get_entity_list():GetSpawnByID(v);
				if not spawn:NPCPointerValid() then
					spawn:Repop(1);
				end
			end
		end
	end
end

function SetRespawnTimers(npcid)						
	for k,v in pairs(spawnpoints) do
		spawn = eq.get_entity_list():GetSpawnByID(v):ForceDespawn();	
		eq.update_spawn_timer(v,259200*1000);	--3 day respawn
	end
end

function SetHP(e)
	eq.set_next_hp_event(75);
end

function CouncilHP(e)	--controlls min/max hit of non-mezzable council members based on HP %
	if e.hp_event == 75 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.");
		eq.set_next_hp_event(50);
		SetDamage(e,2);		
		eq.set_next_inc_hp_event(75);
	elseif e.hp_event == 50 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.");
		eq.set_next_hp_event(25);
		SetDamage(e,3)
		eq.set_next_inc_hp_event(50);
	elseif e.hp_event == 25 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.");
		eq.set_next_hp_event(11);
		SetDamage(e,4)
		eq.set_next_inc_hp_event(25);
	elseif e.hp_event == 11 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"The ground shudders beneath your feet as flecks of dirt and stone fall away from one of the Rathe.");
		SetDamage(e,5);
		eq.set_next_inc_hp_event(11);
	end	
	
	--readjusting weakness level as health regenerates
	if e.inc_hp_event == 75 then
		SetDamage(e,1);
		eq.set_next_hp_event(75);
	elseif e.inc_hp_event == 50 then
		SetDamage(e,2);
		eq.set_next_hp_event(50);
		eq.set_next_inc_hp_event(75);
	elseif e.inc_hp_event == 25 then
		SetDamage(e,3);
		eq.set_next_hp_event(25);
		eq.set_next_inc_hp_event(50);
	elseif e.inc_hp_event == 11 then
		SetDamage(e,4);
		eq.set_next_hp_event(11);
		eq.set_next_inc_hp_event(25);
	end
end

function SetDamage(e,level)
	local damage_tables = {	[1] = {"479","2986"},
								[2] = {"414","2538"},
								[3] = {"343","2055"},
								[4] = {"253","1583"},
								[5] = {"145","870"}};

	eq.GM_Message(15,string.format("Weakness level:[%s] min_hit[%s] max_hit[%s]",level,damage_tables[level][1],damage_tables[level][2]));	--debug
	e.self:ModifyNPCStat("min_hit",damage_tables[level][1]);
	e.self:ModifyNPCStat("max_hit",damage_tables[level][2]);
end

function CouncilTimers(e)
	if e.timer == "banish" and e.self:GetHPRatio() > 10 and not e.self:IsMezzed() then	--only banishes over 11% hp and cannot be mezzed of course
		eq.stop_timer(e.timer);
		eq.set_timer("banish",math.random(6,12) * 1000);		
		
		if eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(),30) then	--check if player is within 30 units
			local roll = math.random(100);
			if roll <= 60 then 	--60% Banish chance
				Banish(e,math.random(1,4));	--banish PC
			end  	
		elseif not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
		end
	end
end

function Banish(e,rand)
	local instance_id = eq.get_zone_instance_id();
	local zone_id = eq.get_zone_id();
	local client = e.self:GetHateRandom():CastToClient();
	
	--banish location table format is min_x,max_x,min_y,max_y,z,h
	local banish_locs = {	[1] = {2050,2090,885,945,-255,0},		--north
							[2] = {1520,1560,390,430,-255,384},	--east
							[3] = {2050,2090,-115,-75,-255,263},	--south
							[4] = {2530,2570,390,430,-255,122},}	--west
	local x,y,z,h = math.random(banish_locs[rand][1],banish_locs[rand][2]),math.random(banish_locs[rand][3],banish_locs[rand][4]),banish_locs[rand][5],banish_locs[rand][6];
	
	if client.valid and not client:GetGM() then
		client:MovePCInstance(zone_id, instance_id,x,y,z,h);
		if math.random(100) <= 85 then	--85% chance the banish will reduce aggro and another person on hatelist will get aggro
			e.self:SetHate(client:CastToMob(),1,1);	--reduce aggro to not summon back
		end
	end
end

function event_timer(e)	--event failure timer reached
	if e.timer == "fail" then
		EndEvent();	
	end
end

function AvatarTimer(e)
	if e.timer == "depop" then
		EndEvent();
	end
end

function EventWin(e)
	eq.spawn2(222148,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ()-10,0);	--#Essence_of_Earth (222148)
	EndEvent();
end

function EndEvent()
	eq.stop_all_timers();
	eq.depop_all(222147);	--#Avatar_of_Earth (222147) -- only applicable on failure
	eq.signal(222156,2);	--#rathe_controller (222156) to unload encounter
end

function event_encounter_load(e)
	--event variables
	eq.set_timer("fail", fail_timer * 1000);
	controller = eq.get_entity_list():GetMobByNpcTypeID(222156);	--#rathe_controller (222156)

	--registered events
	--Mezzable Council Members
	eq.register_npc_event("Rathe_Event", Event.death_complete, 222141, CouncilCheck);	--#A_Rathe_Councilman (222141) 
	eq.register_npc_event("Rathe_Event", Event.timer, 222141, CouncilTimers);			--#A_Rathe_Councilman (222141) 

	
	--Non-Mezzable Council Members
	eq.register_npc_event("Rathe_Event", Event.death_complete, 222140, CouncilCheck);	--A_Rathe_Councilman (222140)
	eq.register_npc_event("Rathe_Event", Event.timer, 222140, CouncilTimers);			--A_Rathe_Councilman (222140) 
	eq.register_npc_event("Rathe_Event", Event.hp, 222140, CouncilHP);					--A_Rathe_Councilman (222140) 
	eq.register_npc_event("Rathe_Event", Event.spawn, 222140, SetHP);					--A_Rathe_Councilman (222140) 
	
	--Council Repop Check (5.7 min timer)
	eq.register_npc_event("Rathe_Event", Event.timer, 222156, CouncilRepop);			--#rathe_controller (222156)

	--Avatar of Earth (Final Phase)
	eq.register_npc_event("Rathe_Event", Event.death_complete, 222147, EventWin);		--#Avatar_of_Earth (222147)
	eq.register_npc_event("Rathe_Event", Event.timer, 222147, AvatarTimer);		--#Avatar_of_Earth (222147)
end
