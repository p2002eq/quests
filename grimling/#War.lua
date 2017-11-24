--FINAL WAR HELPER NPC (FOR TESTING)

--FINAL WAR ENCOUNTER SPAWNPOINTS
local spawnpoints = {	334892, 334893, 334894, 334895, 334896, 334897, 334898, 334899, 334900, 334901, 334902, 334903, 334904, 334905, 334906, 334907, 334908, 334909, 334910, --North camp spawns
						334911, 334912, 334913, 334914, 334915, 334916, 334917, 334918, 334919, 334920,	--North camp spawns (continued)
						334863, 334864, 334865, 334866, 334867, 334868, 334869, 334870, 334871, 334872, 334873, 334874, 334875, 334876, 334877, 334878, 334879, 334880, 334881,	--acrylia caverns platforms
						334882, 334883, 334884, 334885, 334886, 334887, 334888, 334889, 334890, 334891};	--acrylia caverns platforms

		
scout = 167196;				
local pathing_target = {[1] = {767, 827, 18}, --acrylia caverns
						[2] = {-1048,1089,11} };  --northern camp
						
local veterans = {	167731, 	--Shiktan
					167732, 	--Kufur
					167733};	--Fhelik
						 

function event_say(e)
	if e.other:GetGM() then
		if (e.message:findi("hail")) then
			e.self:Say("would you like to [" .. eq.say_link("start") .. "] the war event?  Or [" .. eq.say_link("depop") .. "] or [" .. eq.say_link("repop") .. "]?  How about show spawnpoints at [ " .. eq.say_link("camp 1") .. "] or [ " .. eq.say_link("camp 2") .. " or [" .. eq.say_link("my location") .. "]?  [" .. eq.say_link("adds") .. "].");
		elseif (e.message:findi("start")) then
			local scout  = eq.get_entity_list():GetNPCByNPCTypeID(scout);
			scout:GMMove(-1058, 1075, 11, 230,true);
			eq.unique_spawn(veterans[1], 0, 0, -1079, 1114, 6, 94);
			eq.unique_spawn(veterans[2], 0, 0, 783, 797, 12, 65);
			eq.unique_spawn(veterans[3], 0, 0, 798, 712, 16, 65);
			eq.load_encounter("Final_War");
		elseif (e.message:findi("depop")) then
			DepopCamp();
		elseif (e.message:findi("repop")) then
			RepopCamp();
		elseif (e.message:findi("camp 1")) then
			GetSpawns(1);
		elseif (e.message:findi("camp 2")) then
			GetSpawns(2);
		elseif (e.message:findi("my location")) then
			GetSpawnsMyLoc(e);			
		elseif (e.message:findi("adds")) then
			eq.set_timer("waves",1 * 1000);
			x = 1;
		end
	end
end

function event_timer(e)
	if e.timer == "waves" then
		eq.set_timer("waves",30 * 1000);
		eq.zone_emote(13,"Spawn location: " .. x);
		for n = 1,6 do
			spawn_mob2(167728,2, x)
		end
		x = x + 1;
	end
end
function spawn_mob2(NPCID, camp, loc) --FINAL WAR northern camp spawnpoints

	local spawn_loc = {[1] = {-818, 1088, 100, 192}, [2] = {-921, 1201, 36 ,166}, [3] = {-1184, 1220, 40, 102}, [4] = {-1254, 1017, 85, 54}, [5] = {-1103, 911, 76, 22}, [6] = {-820, 909, -5, 217} } --northern camp spawnpoints
	
	mobz = eq.spawn2(NPCID,0,0,spawn_loc[loc][1] + math.random(-10,10) ,spawn_loc[loc][2] + math.random(-10,10) ,spawn_loc[loc][3],spawn_loc[loc][4]);
	mobz:SetRunning(true);
	mobz:CastToNPC():MoveTo(pathing_target[camp][1] + math.random(-10,10), pathing_target[camp][2] + math.random(-10,10), pathing_target[camp][3], -1, true)  --x,y,z,h
	
	--local target = eq.get_entity_list():GetRandomClient(pathing_target[camp][1], pathing_target[camp][2], pathing_target[camp][3],100 * 100)
	--mobz:AddToHateList(target,1);
end

function spawn_mob1(NPCID, camp, loc) --FINAL WAR acrylia camps

	local spawn_loc = {[1] = {1035, 877, 73, 185}, [2] = {926,1080,159,149}, [3] = {512, 928, 45, 80}, [4] = {607, 628, -6, 33}, [5] = {865, 535, 28, 246}, [6] = {1061,655,39,218} };  --acrylia mines spawn points (considered camps 1 & 2)
	
	mobz = eq.spawn2(NPCID,0,0,spawn_loc[loc][1] + math.random(-10,10) ,spawn_loc[loc][2] + math.random(-10,10) ,spawn_loc[loc][3],spawn_loc[loc][4]);
	mobz:CastToNPC():MoveTo(pathing_target[1][1] + math.random(-10,10), pathing_target[1][2] + math.random(-10,10), pathing_target[1][3], -1, true)  --x,y,z,h
	
	local target = eq.get_entity_list():GetRandomClient(pathing_target[camp][1], pathing_target[camp][2], pathing_target[camp][3],200*200)
	mobz:AddToHateList(target,1);
end

function DepopCamp()
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

function RepopCamp()
	for _,spawns in pairs(spawnpoints) do
		local CampSpawn = eq.get_entity_list():GetSpawnByID(spawns);
		CampSpawn:Enable();
		CampSpawn:Reset();
		CampSpawn:Repop(5);
	end
	
	--encounter unload check
	if unload then
		eq.unload_encounter("Final_War");
	end
end

function GetSpawns(camp)
	local npc_list = eq.get_entity_list():GetNPCList();
	
	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if npc:CalculateDistance(unpack(pathing_target[camp])) <= 200 and npc:GetNPCTypeID() ~= scout and not npc:IsPet() then
				npc:Shout("My spawnpoint id is: " .. npc:GetSpawnPointID() .. "  Camp " .. camp);
				--return true	--mobs still in camp
			end
		end
	end
	
	return false
end

function GetSpawnsMyLoc(e)
	local npc_list = eq.get_entity_list():GetNPCList();
	
	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if npc:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 100 and npc:GetNPCTypeID() ~= scout and not npc:IsPet() and npc:GetNPCTypeID() ~= 167718 then
				npc:Shout("My spawnpoint id is: " .. npc:GetSpawnPointID());
				--return true	--mobs still in camp
			end
		end
	end
	
	return false
end