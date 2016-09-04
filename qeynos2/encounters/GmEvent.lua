-- emotes / factions / boss ids / grid point / timers
local wave = 0;
local mobs = {2002,17033,17022,18044,18039,18020,18127,18097,17037};
--local bosses = {2124,2102,2174};
local bosses = {2178,2177,2176};  --live

function event_encounter_load(e)
	eq.depop_zone(false);
	spawn_Guards();
	eq.set_timer("chat1", 5000); 
end

function event_timer(e)
	if (e.timer == "chat1") then
		eq.zone_emote(14,"A ringing of warning bells reverberates throughout your mind.  Something doesn't quite seem right.");
		eq.set_timer("chat2",30000);
	elseif(e.timer == "chat2") then
		eq.zone_emote(13, "Corporal Lancelot shouts, Stand fast troops, we must hold out till help arrives.");
		eq.set_timer("chat3",15000);
	elseif(e.timer == "chat3") then
		eq.zone_emote(13,"Soulbinder Jera shouts, Qeynos is under attack, they ask for all available aid at the main gate.");
		eq.set_timer("chat4",15000);
	elseif(e.timer == "chat4") then
		eq.zone_emote(13,"Fippy Darkpaw Shouts, Too long has Qeynos ruined our lands, now we shall ruin yours!");
		eq.set_timer("wave1",60000);
		wave = 1;
	elseif(e.timer == ("wave" .. wave)) then
		if (wave == 1) then
			spawn_wave(mobs[wave],mobs[wave],0);
		else
			if (wave % 3 == 0) then
				spawn_wave(mobs[wave-1],mobs[wave],bosses[wave/3]);
				eq.zone_emote(15,"3's done");
			else
				eq.zone_emote(15,"normal");
				spawn_wave(mobs[wave-1],mobs[wave],0);
				eq.zone_emote(15,"normal done");
			end
		end		
		wave = wave+1;
		if(wave < 10) then
			eq.set_timer("wave" .. wave,300000);
		else
			eq.set_timer("repop",600000);		-- 10 minute till repop.
		end
	elseif(e.timer == "repop") then
		eq.depop_zone(false);
		eq.repop_zone();
	end
	eq.stop_timer(e.timer);
end

function spawn_wave(npcId, npcId2, bossId)
-- middle spawn
	spawn_Mobs(npcId, 22, 1282, 3, 200, 1282, 3, 127, 10, 150);
	spawn_Mobs(npcId2, 22, 1312, 3, 200, 1312, 3, 127, 10, 150);	
	if (bossId ~= 0) then
		local mob = eq.spawn2(bossId, 150, 0, 110, 1342, 3, 127);
		mob:SetRunning(true);
	end
	
-- east spawn
	spawn_Mobs(npcId, 895, 1313, 3, 1011, 1218, 3, 101, 8, 150);
	spawn_Mobs(npcId2, 22, 1312, 3, 200, 1312, 3, 127, 8, 150);	

-- west spawn
	spawn_Mobs(npcId, -735, 1338, 3, -835, 1241, 3, 101, 8, 150);
	spawn_Mobs(npcId2, 22, 1312, 3, 200, 1312, 3, 127, 8, 150);	
end

function spawn_Guards()
	eq.spawn2(2016, 0, 0, 130, 311, 1, 0):CastToNPC():ModifyNPCStat("runspeed","0");
	local guard1 = eq.get_entity_list():GetMobByNpcTypeID(2016);
	guard1:CastToNPC():SetNPCFactionID(519);	-- 519
	eq.spawn2(1091, 0, 0, 108, 311, 1, 0):CastToNPC():ModifyNPCStat("runspeed","0");
	local guard2 = eq.get_entity_list():GetMobByNpcTypeID(1091);
	guard2:CastToNPC():SetNPCFactionID(519);	-- 519
	eq.spawn2(1090, 0, 0, 119, 311, 1, 0):CastToNPC():ModifyNPCStat("runspeed","0");
	local guard3 = eq.get_entity_list():GetMobByNpcTypeID(1090);
	guard3:CastToNPC():SetNPCFactionID(519);	-- 519
end

function round(num, dec)
	local temp = 10^dec;
	return math.floor(num * temp + .5) / temp;
end

function spawn_Mobs(npcId, startX, startY, startZ, endX, endY, endZ, heading, numMobs, grid)
	eq.zone_emote(15,"spawnmobs");
	local xDiff = round((startX - endX) / numMobs, 2) * -1;
	local yDiff = round((startY - endY) / numMobs, 2) * -1;
	local zDiff = round((startZ - endZ) / numMobs, 2) * -1;
	
	for i = 0, numMobs-1 do
		eq.spawn2(npcId, grid, 0, startX + (xDiff*i), startY + (yDiff*i), startZ + (zDiff*i), heading);
	end
end