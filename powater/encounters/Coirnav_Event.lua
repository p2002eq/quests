--Coirnav, The Avatar of Water Event
--By Daeron


--failure variables
local fail_timer = 15*60;	--15 min to fail
local fail = false;
local timer;
local phase2_timer = 180; --default 180 seconds (3 min into event)
local phase3_timer = 300; --default 300 seconds (5 min into event)

local phase2;
local phase3;
local phase4;
 
function EventReset()
	eq.stop_all_timers();
	timer = 0;
	counter = 0;
	fail = false;
	phase2, phase3, phase4, final = false,false,false,false;
end

function Phase1Setup()
	coirnav = eq.get_entity_list():GetMobByNpcTypeID(216048);
	coirnav:Shout("Those that violate my domain will pay. I call upon the power imbued to me by Povar! Come forth my minions of vapor and destroy these intruders.");
	eq.spawn2(216265,0,0,-858,1095,-460,138);	--#Pwelon_of_Vapor (216265)
	spawn_trash(216275,25);	--#a_triloun_vaporfiend (216275)  (25 mobs)
end

function Phase2Setup()
	coirnav:Shout("Those that violate my domain will pay. I call upon the power imbued to me by E`ci! Come forth my minions of ice and destroy these intruders.");
	eq.spawn2(216264,0,0,-858,1095,-460,138);	--#Nrinda_of_Ice (216264)
	spawn_trash(216237,25);	--#a_hraquis_icefiend (216237)  (25 mobs)
end

function Phase3Setup()
	coirnav:Shout("Those that violate my domain will pay. I call upon the power imbued to me by Tarew Marr! Come forth minions of water and destroy these intruders.");
	eq.spawn2(216271,0,0,-858,1095,-460,138);	--#Vamuil_of_Water (216271)
	spawn_trash(216250,25);	--#a_regrua_waterfiend (216250)  (25 mobs)
end

function Phase4Check()	--Checks to advance after phases 1 - 3 have been completed
	local mob_table = {216275,216237,216250};
	
	if phase3 and not mob_check(mob_table) and not phase4 then
		Phase4Setup();
		phase4 = true;
	end	
end

function Phase4Setup()
	coirnav:Shout("Fools you have gotten this far but you will not succeed. Pwelon, Nrinda, and Vamuil kill these intruders!");
	
	--Depop fake boss versions if up
	eq.depop(216265);	--#Pwelon_of_Vapor (216265)
	eq.depop(216264);	--#Nrinda_of_Ice (216264)
	eq.depop(216271);	--#Vamuil_of_Water (216271)
	
	--Respawn real versions of mini-bosses
	eq.spawn2(216279,0,0,-885,1125,-475,138);	--#Pwelon_of_Vapor (216279)
	eq.spawn2(216278,0,0,-885,1100,-475,138);	--#Nrinda_of_Ice (216278)
	eq.spawn2(216280,0,0,-885,1075,-475,138);	--#Vamuil_of_Water (216280
end

function FinalStage()
	local mob_table = {216278,216279,216280};	--real boss versions:  #Nrinda_of_Ice (216278), #Pwelon_of_Vapor (216279), #Vamuil_of_Water (216280)
	
	if not mob_check(mob_table) and not final then	--checks to see if 3 minibosses are dead before triggering vulnerable coirnav version
		final = true;
		coirnav:Shout("Defenders of vapor, ice, and water I call thee to my aid.  Destroy the defilers of water.");
		
		--Set Coirnav vulnerabilities
		coirnav:SetBodyType(23, true);		--Sets bodytype as Monster (targetable)
		coirnav:SetSpecialAbility(24, 0);	--Sets ability to aggro players
		coirnav:SetSpecialAbility(19,0);	--removes immunity to melee
		coirnav:SetSpecialAbility(20,0);	--removes immunity to magic
		coirnav:SetSpecialAbility(22,0);	--removes immunity to non-bane melee
		coirnav:SetSpecialAbility(26,0);	--removes immunity to ranged spells
		coirnav:WipeHateList();				--reset hatelist
		
		--spawn trash (30 mobs)
		spawn_trash(216277,10)	--#a_triloun_vaporling (216277)
		spawn_trash(216238,10)	--#a_hraquis_iceling (216238)
		spawn_trash(216251,10)	--#a_regrua_waterling (216251)
	end
end

function GuardSpot(e)	--save guard position for fake named mobs
	if not e.joined then
		e.self:SaveGuardSpot(true);
	end
end

function spawn_trash(npcid,count)	--spawns trash around Coirnav
	for n = 1,count do
		mob = eq.spawn2(npcid,220,0,-858 + math.random(-20,20),1095 + math.random(-75,75),-500 + math.random(-15,35),138);	
	end
end

function event_timer(e)
	if e.timer == "Event_HB" then
		timer = timer + 1;	--tracks event timer in seconds
		if timer == phase2_timer and not phase2 then	--3 min into event	(Spawn Nrinda of Ice)
			Phase2Setup();
			phase2 = true;
		elseif timer == phase3_timer and not phase3 then	--5min into event (Spawn Vamuil of Water)
			Phase3Setup();
			phase3 = true;
		elseif timer == 600 then	--10 min into event
			eq.zone_emote(7,"Coirnav the Avatar of Water is suddenly surrounded by a slight glow. A low constant humming is heard in the background.");
		elseif timer == 720 then	--12 min into event
			eq.zone_emote(7,"Coirnav the Avatar of Water is now glowing noticeably brighter and the constant humming is getting louder.");
		elseif timer == 840 then	--14 min into event (1 min warning before failure/banish)
			eq.zone_emote(7,"Coirnav the Avatar of Water glows to brilliant flash of light that suddenly fades. The constant humming suddenly becomes a deafening roar that also mysteriously fades away.");
		end
	elseif e.timer == "fail" then
		eq.stop_all_timers();
		coirnav:Shout("Violators of this plane be banished from this domain!");
		ZoneBanish();	--Banishes anyone in the zone
		DepopEvent();
		eq.signal(216276,1);	--signal #coirnav_unloader (216276) to unload encounter
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

function ZoneBanish()
	local player_list = eq.get_entity_list():GetClientList();
	
	if player_list ~= nil then
		for player in player_list.entries do
			player:CastToMob():SpellFinished(1099,player);  --Banishment of the Pantheon
		end
	end
end

function EventWin(e)
	eq.stop_all_timers();
	DepopEvent();
	eq.zone_emote(7,"The monstrous creature spasms in its last death throes sending shockwaves through the reef.  Coirnav the Avatar of Water, empowered by the focus of the Triumvirate, has fallen at the hands of the brave adventurers deep within the reef.");
	eq.spawn2(216253,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ() - 15, e.self:GetHeading());	--#Essence_of_Water (216253)
	eq.signal(216276,1);	--signal #coirnav_unloader (216276) to unload encounter
end
	
	
function DepopEvent()	
	local mob_list = {216275,216265,216271,216250,216264,216237,216048,216238,216251,216277,216278,216279,216280};  -- All trash and bosses including Coirnav himself (if failure)	
	for _,mob in pairs(mob_list) do
		eq.depop_all(mob);
	end
end

function event_encounter_load(e)
	--event variables
	EventReset();
	Phase1Setup();

	eq.set_timer("Event_HB", 1 * 1000);
	eq.set_timer("fail", fail_timer * 1000);
	--registered events						
	
	--Kill counter checks (applicable to phase 3 only)
	eq.register_npc_event("Coirnav_Event", Event.death_complete, 216275, Phase4Check);		--#a_triloun_vaporfiend (216275)
	eq.register_npc_event("Coirnav_Event", Event.death_complete, 216237, Phase4Check);		--#a_hraquis_icefiend (216237)
	eq.register_npc_event("Coirnav_Event", Event.death_complete, 216250, Phase4Check);		--#a_regrua_waterfiend (216250)
	
	--Guard spot saving for moving fake bosses
	eq.register_npc_event("Coirnav_Event", Event.combat, 216265, GuardSpot);		--#Pwelon_of_Vapor (216265)
	eq.register_npc_event("Coirnav_Event", Event.combat, 216264, GuardSpot);		--#Nrinda_of_Ice (216264)
	eq.register_npc_event("Coirnav_Event", Event.combat, 216271, GuardSpot);		--#Vamuil_of_Water (216271)
	
	--Phase 4 Checks (Coirnav targetable with 3 weaker version boss adds)
	eq.register_npc_event("Coirnav_Event", Event.death_complete, 216279, FinalStage);		--#Pwelon_of_Vapor (216279)
	eq.register_npc_event("Coirnav_Event", Event.death_complete, 216278, FinalStage);		--#Nrinda_of_Ice (216278)
	eq.register_npc_event("Coirnav_Event", Event.death_complete, 216280, FinalStage);		--#Vamuil_of_Water (216280)

	--Coirnav Killed
	eq.register_npc_event("Coirnav_Event", Event.death_complete, 216048, EventWin);			--#Coirnav_the_Avatar_of_Water (216048)
end

	