wave = nil;
local xloc = -739;
local yloc = 518;
local zloc = 120;

local xloc1 = -739;
local yloc1 = 438;
local zloc1 = 126;
local hloc1 = 2.0;

local xloc2 = -810;
local yloc2 = 518;
local zloc2 = 121;
local hloc2 = 2.0;

local xloc3 = -672;
local yloc3 = 507;
local zloc3 = 121;
local hloc3 = 2.0;

local xloc4 = -741;
local yloc4 = 715;
local zloc4 = 123;
local hloc4 = 2.0;

local xlocBoss = -739;
local ylocBoss = 518;
local zlocBoss = 120;
local hlocBoss = 2.0;

--vulakEvent = true;

function event_encounter_load(e)
	-- start event in 1 minute
	eq.zone_emote(14,"load encounter");
	eq.set_timer("wave1", 10000); -- timer to start wave 1
end


function event_signal(e)
	if(e.signal == 1) then --player died
        if( wave == 3) then -- spawn carrion drake randomly in the ring
           eq.spawn2(124315,0,0,xloc1,yloc1,zloc1,2.0);  -- add NPCID edit size of the ring
        elseif(wave == 4) then -- spawn carrion drake randomly in the ring
            eq.spawn2(124315,0,0,xloc1,yloc1,zloc1,2.0);  -- add NPCID edit size of the ring
        end
    end
end

function event_timer(e)
	if(e.timer == "wave1") then		
		eq.stop_timer(e.timer);
		eq.zone_emote(14,"wave 1");
		local npcs = {124284,124157,176010};		-- despawn guardians
		local npc_list = eq.get_entity_list():GetNPCList();
		if(npc_list ~= nil) then
			for npc in npc_list.entries do
				for i = 1, #npcs do			
					if(npc:GetNPCTypeID() == npcs[i]) then
						eq.zone_emote(14,"depopping");
						npc:Depop();
					end
				end
			end
		end
	
		eq.spawn2(124325,0,0,-719,1019,121.5,122);	-- spawn dt destroyers
		eq.spawn2(124325,0,0,-740,1020,121.5,122);
		eq.spawn2(124325,0,0,-760,1020,121.5,122);
		wave = 1;
		eq.set_timer("wave2", 10000); -- timer to start wave 2
		eq.spawn2(124081,0,0,xloc4,yloc4,zloc4,hloc4);
		eq.spawn2(124059,0,0,xloc2,yloc2,zloc2,hloc2);
		eq.spawn2(124059,0,0,xloc3,yloc3,zloc3,hloc3);
		spawn_hatchlings();
    elseif(e.timer == "wave2") then
        eq.zone_emote(14,"wave2");
        wave = wave + 1; -- wave = 2
        eq.stop_timer(e.timer)
        eq.set_timer("wave3", 10000); -- timer to start wave 3
        eq.spawn2(124314,0,0,xloc1,yloc1,zloc1,hloc1);
        spawn_hatchlings();
    elseif(e.timer == "wave3") then
		eq.zone_emote(14,"wave3");
        wave = wave + 1; -- wave = 3
        eq.stop_timer(e.timer)
        eq.set_timer("wave4", 30000); -- timer to start wave 4
		eq.spawn2(214104,0,0,-770,1270,123,132);	-- invisible placeholder to spawn carrion drakes
        eq.spawn2(124081,0,0,xloc4,yloc4,zloc4,hloc4);
        eq.spawn2(124081,0,0,xloc4,yloc4,zloc4,hloc4);
        eq.spawn2(124059,0,0,xloc2,yloc2,zloc2,hloc2);
        eq.spawn2(124059,0,0,xloc3,yloc3,zloc3,hloc3);
		eq.signal(124081,1);
		eq.signal(124059,1);
		spawn_hatchlings();       
    elseif(e.timer == "wave4") then
        eq.zone_emote(14,"wave4");
        wave = wave + 1; -- wave = 4
        eq.stop_timer(e.timer)
        eq.set_timer("wave5", 30000); -- timer to start wave 5
        eq.spawn2(124316,0,0,xloc4,yloc4,zloc4,hloc4);
    elseif(e.timer == "wave5") then
		eq.zone_emote(14,"wave5");
        wave = wave + 1; -- wave = 5
        eq.stop_timer(e.timer)
		eq.signal(214104,2);
        eq.set_timer("wave6", 10000); -- timer to start wave 6
		eq.spawn2(124081,0,0,xloc4,yloc4,zloc4,hloc4);
        eq.spawn2(124081,0,0,xloc4,yloc4,zloc4,hloc4);
		eq.spawn2(124059,0,0,xloc2,yloc2,zloc2,hloc2);
        eq.spawn2(124059,0,0,xloc3,yloc3,zloc3,hloc3);
		spawn_hatchlings();
    elseif(e.timer == "wave6") then
		eq.zone_emote(14,"wave6");
        wave = wave + 1; -- wave = 6
        eq.stop_timer(e.timer)
        eq.set_timer("wave7", 10000); -- timer to start wave 7
		eq.spawn2(124317,0,0,xloc2,yloc2,zloc2,hloc2); -- splits like the horses in Sky
		eq.spawn2(124324,0,0,xloc3,yloc3,yloc3,yloc3); -- splits like the horses in Sky
    elseif(e.timer == "wave7") then
		eq.zone_emote(14,"wave7");
        wave = wave + 1; -- wave = 7
        eq.stop_timer(e.timer)
        eq.set_timer("wave8", 10000); -- timer to start wave 8
		eq.spawn2(124314,0,0,xloc2,yloc2,zloc2,hloc2);
		eq.spawn2(124314,0,0,xloc4,yloc4,zloc4,hloc4);
		eq.spawn2(124314,0,0,xloc3,yloc3,zloc3,hloc3);
    elseif(e.timer == "wave8") then
		eq.zone_emote(14,"wave8");
        wave = wave + 1; -- wave = 8
        eq.stop_timer(e.timer)
        eq.set_timer("wave9", 10000); -- timer to start wave 9
		eq.spawn2(124318,0,0,xlocBoss,ylocBoss,zlocBoss,hlocBoss);
		eq.spawn2(124319,0,0,xlocBoss +5,ylocBoss +5,zlocBoss,hlocBoss);
    elseif(e.timer == "wave9") then
		eq.zone_emote(14,"wave9");
        wave = wave + 1; -- wave = 9
        eq.stop_timer(e.timer)
        eq.set_timer("wave10", 10000); -- timer to start wave 10
		eq.spawn2(124320,0,0,xloc2,yloc2,zloc2,hloc2);
		eq.spawn2(124320,0,0,xloc4,yloc4,zloc4,hloc4);
		eq.spawn2(124320,0,0,xloc3,yloc3,zloc3,hloc3);
		eq.spawn2(124320,0,0,xloc1,yloc1,zloc1,hloc1);
		eq.spawn2(124320,0,0,xlocBoss,ylocBoss,zlocBoss,hlocBoss);
    elseif(e.timer == "wave10") then
		eq.zone_emote(14,"wave10");
        wave = wave + 1; -- wave = 10
        eq.stop_timer(e.timer)
        eq.set_timer("wave11", 10000); -- timer to start wave 11
		eq.spawn2(124314,0,0,xloc2,yloc2,zloc2,hloc2);
		eq.spawn2(124314,0,0,xloc3,yloc3,zloc3,hloc3);
    elseif(e.timer == "wave11") then
		eq.zone_emote(14,"wave11");
        wave = wave + 1; -- wave = 11
        eq.stop_timer(e.timer)
        eq.set_timer("wave12", 10000); -- timer to start wave 12
		eq.spawn2(124320,0,0,xloc2,yloc2,zloc2,hloc2);
		eq.spawn2(124320,0,0,xloc3,yloc3,zloc3,hloc3);
		eq.spawn2(124314,0,0,xloc1,yloc1,zloc1,hloc1);
    elseif(e.timer == "wave12") then
		eq.zone_emote(14,"wave12");
        wave = wave + 1; -- wave = 12
        eq.stop_timer(e.timer)
        eq.set_timer("wave13", 10000); -- timer to start wave 13
		eq.spawn2(124321,0,0,xlocBoss,ylocBoss,zlocBoss,hlocBoss);
    elseif(e.timer == "wave13") then
		eq.zone_emote(14,"wave13");
        wave = wave + 1; -- wave = 13
        eq.stop_timer(e.timer)
        eq.set_timer("wave14", 10000); -- timer to start wave 14
		eq.spawn2(124314,0,0,xloc2,yloc2,zloc2,hloc2);
		eq.spawn2(124314,0,0,xloc3,yloc3,zloc3,hloc3);
		eq.spawn2(124314,0,0,xloc1,yloc1,zloc1,hloc1);
    elseif(e.timer == "wave14") then
		eq.zone_emote(14,"wave14");
        wave = wave + 1; -- wave = 14
        eq.stop_timer(e.timer)
        eq.set_timer("wave15", 10000); -- timer to start wave 15
        eq.spawn2(124326,0,0,xloc2,yloc2,zloc2,hloc2); --splits into 3 total of 9 for wave 3 per
		eq.spawn2(124326,0,0,xloc3,yloc3,zloc3,hloc3); --splits into 3
		eq.spawn2(124326,0,0,xloc1,yloc1,zloc1,hloc1); --splits into 3
    elseif(e.timer == "wave15") then
		eq.zone_emote(14,"wave15");
        wave = wave + 1; -- wave = 15
        eq.stop_timer(e.timer)
        eq.set_timer("wave16", 10000); -- timer to start wave 16
		eq.spawn2(124317,0,0,xloc2,yloc2,zloc2,hloc2); --splits into 2, 5 times total of 22 for wave 11 per
		eq.spawn2(124324,0,0,xloc3,yloc3,zloc3,hloc3); --splits into 2, 5 times
    elseif(e.timer == "wave16") then
		eq.zone_emote(14,"wave16");
        wave = wave + 1; -- wave = 16
        eq.stop_timer(e.timer)
        eq.set_timer("wave17", 10000); -- timer to start wave 17
		eq.spawn2(124322,0,0,xlocBoss,ylocBoss,zlocBoss,hlocBoss);
    elseif(e.timer == "wave17") then
		eq.zone_emote(14,"wave17");
        wave = wave + 1; -- wave = 17
        eq.stop_timer(e.timer)
        eq.set_timer("depop", 10000); -- starts depop
		eq.spawn2(124323,0,0,xlocBoss,ylocBoss,zlocBoss,hlocBoss);
	elseif(e.timer == "depop") then
		eq.depop_all(124323);
		wave = nil;
		eq.unload_encounter("Vulak_Event");
    end
end

function spawn_hatchlings()
    local wave1Spawns = 4;
    for i = 1, wave1Spawns do
        eq.spawn2(124312,0,0,xloc+math.random(-45,45),yloc+math.random(-45,45),zloc,math.random(0, 250));
    end
end