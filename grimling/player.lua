--PLAYER LUA FOR FINAL WAR
--FINAL WAR ENCOUNTER SPAWNPOINTS
local spawnpoints = {	334892, 334893, 334894, 334895, 334896, 334897, 334898, 334899, 334900, 334901, 334902, 334903, 334904, 334905, 334906, 334907, 334908, 334909, 334910, --North camp spawns
						334911, 334912, 334913, 334914, 334915, 334916, 334917, 334918, 334919, 334920,	--North camp spawns (continued)
						334863, 334864, 334865, 334866, 334867, 334868, 334869, 334870, 334871, 334872, 334873, 334874, 334875, 334876, 334877, 334878, 334879, 334880, 334881,	--acrylia caverns platforms
						334882, 334883, 334884, 334885, 334886, 334887, 334888, 334889, 334890, 334891};	--acrylia caverns platforms

						
local veterans = {167196, 167731, 167732, 167733};	--for looping iterations

function event_say(e)
	if e.self:GetGM() then
		if (e.message:findi("war help")) then
			e.self:Message(1,"War event help options:  [" .. eq.say_link("start war") .. "],  [" .. eq.say_link("depop war camps") .. "] or [" .. eq.say_link("repop war camps") .. "]?");
		elseif e.message:findi("start war") then
			e.self:Message(1,"CAUTION:  Starting war event will immediately load encounter and spawn Vah Shir guards at the encampments.  Make sure everyone is setup and ready at proper encampments.  Let me know when you are [" .. eq.say_link("ready to start") .. "].");
		elseif (e.message:findi("ready to start")) then
			if eq.get_entity_list():IsMobSpawnedByNpcTypeID(veterans[1]) then
				local vet  = eq.get_entity_list():GetNPCByNPCTypeID(veterans[1]);
				vet:GMMove(-1058, 1075, 11,460.0,true);
			else
				eq.spawn2(veterans[1],0,0,-1058, 1075, 11,460.0)
			end
			for n = 2,4 do
				eq.depop_all(veterans[n])	--depop other vets if up
			end
			eq.spawn2(veterans[2], 0, 0, -1079, 1114, 6,188.0);
			eq.spawn2(veterans[3], 0, 0, 783, 797, 12,130.0);
			eq.spawn2(veterans[4], 0, 0, 798, 712, 16,130.0);
			eq.load_encounter("Final_War");
		elseif (e.message:findi("depop war camps")) then
			DepopCamp();
		elseif (e.message:findi("repop war camps")) then
			RepopCamp();
		end
	end
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
end
