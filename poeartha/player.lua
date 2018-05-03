--player.lua for
--PoEarthA

function event_enter_zone(e)
    local instance_id = eq.get_zone_instance_id();
    local instance_version = eq.get_zone_instance_version();
    local discs = require('disciplines');
    discs:update_discs(e, e.self:GetLevel());

    if(instance_id ~= 0) then
        e.self:Message(15,"You have entered an Instanced Version of the zone.");
    end
end

function event_level_up(e)
    local discs = require('disciplines');
    discs:train_discs(e, e.self:GetLevel());
end

function event_say(e)
	if e.message:findi("get spawns") then
		GetSpawnsMyLoc(e)
	elseif e.message:findi("depop") then
		Depop();
	elseif e.message:findi("stone test") then
		eq.depop_all(218373);
		eq.spawn2(218373,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	elseif e.message:findi("dust test") then	
		eq.depop_all(218347);
		eq.spawn2(218347,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	elseif e.message:findi("test") then
		--eq.depop_all(218373);
		--eq.spawn2(218373,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		-- eq.depop_all(218347);
		-- eq.spawn2(218347,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		
		local qglobals = eq.get_qglobals();
		local instance_id = eq.get_zone_instance_id();
		local started = tostring(instance_id .. "_Arbitor_PoEarthA_started");
		local ringcount = tostring(instance_id .. "_Arbitor_PoEarthA_ringcount");
		counter = tonumber(qglobals[ringcount]) + 1;
		eq.set_global(started, "1",3,"D3");
		eq.set_global(ringcount,tostring(counter) ,3,"D3");	
		eq.GM_Message(18,"started qglobal:" .. qglobals[started]);
		eq.GM_Message(18,"ringcount qglobal:" .. qglobals[ringcount]);
		eq.GM_Message(13,string.format("Arbitor ring qglobal is now started! Ring Count: [%s]",qglobals[ringcount]))
	elseif e.message:findi("signal") then
		eq.signal(218394,0);	--#arbitor_controller (218394)
	elseif e.message:findi("clear") then
		local instance_id = eq.get_zone_instance_id();
		eq.delete_global(instance_id .. "_Arbitor_PoEarthA_started")
		eq.delete_global(instance_id .. "_Arbitor_PoEarthA_ringcount");
		eq.delete_global(instance_id .. "_Arbitor_PoEarthA_cooldown");
		eq.delete_global(instance_id .. "_VineRing_PoEarthA");
		eq.delete_global(instance_id .. "_StoneRing_PoEarthA");
		eq.delete_global(instance_id .. "_MudRing_PoEarthA"); 
		eq.delete_global(instance_id .. "_DustRing_PoEarthA"); --debug
	end
end


function GetSpawnsMyLoc(e)
	local npc_list = eq.get_entity_list():GetNPCList();
	local mob_list = {};
	local counter = 0;
	
	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if npc:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 50 then
				counter = counter + 1;
				mob_list[counter] = npc:GetSpawnPointID();
				npc:Shout("My spawnpoint id is: " .. npc:GetSpawnPointID());
				--return true	--mobs still in camp
			end
		end
	end
	
	e.self:Message(13,"Spawnpoints:  " ..  tostring(mob_list[1]) .. ", " ..  tostring(mob_list[2]) .. ", " ..  tostring(mob_list[3]) .. ", " ..  tostring(mob_list[4]) .. ", " ..  tostring(mob_list[5]) .. ", " ..  tostring(mob_list[6]) .. ", " ..  tostring(mob_list[7]) .. ", " ..  tostring(mob_list[8]) .. ", " ..  tostring(mob_list[9]) .. ", " ..  tostring(mob_list[10]));

end	

function Depop()
	local spawnpoints = {	365475,365692,365969,366014,367310,367349,366594,366588,365509, 365897, 365898, 366319,366206,	--undead spawns (13)
							366554,365670,367496,365950,366118,367126,366186,367255,366738,366409,365549,365886,367024,366237,365605,366297,367182,366584,365320,366039,			--GEM MOBS (20)  
							366698,367239,365564,366544,366080,	--Vekerchiki spawns (5)
							366553,365538,367096,366915,367129,	--croc
							366174,365793,367353,366782,365288,	--tree traps
							366143,366780,365850,366865,366465,	--dust traps, living earth (earthcrusader ph), magical collection of dust - stone traps
							365901,367122,366410,366960,367522,	--frog traps 366410(koras hunter/named ph)
							365483,366352,366495,365816,366459,	--earth initiate
							366232,365648,366703,366158,365663,	--mudfilled golem
							365308,366179,365269,365479,366534	--stone traps ()
							}
	for k,v in pairs(spawnpoints) do
		spawn = eq.get_entity_list():GetSpawnByID(v);
		spawn:ForceDespawn();
	end
end
