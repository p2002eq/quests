local wave = 0;
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

local xloc4 = -739;
local yloc4 = 897;
local zloc4 = 121;
local hloc4 = 2.0;

local xlocBoss = -739;
local ylocBoss = 518;
local zlocBoss = 120;
local hlocBoss = 2.0;

function event_spawn(event)
    eq.set_proximity(xloc - 45, xloc + 45, yloc - 45, yloc + 45, zloc - 45, zloc + 45);
end

function event_enter(event)
    wave = wave + 1;
    eq.set_timer("wave1", 600000); -- starts wave 2
    eq.spawn2("wurm",0,0,xloc4,yloc4,zloc4,hloc4);
    eq.spawn2("drake",0,0,xloc2,yloc2,zloc2,hloc2);
    eq.spawn2("drake",0,0,xloc3,yloc3,zloc3,hloc3);
    
    local wave1Spawns = 4;
    
    for i = 1, wave1Spawns do
        eq.spawn2("rampaging hatchlings",0,0,
                    xloc+math.random(-45,45),
                    yloc+math.random(-45,45),
                    zloc,
                    math.random(0, 250)
        );
    end
end

function event_signal(e)
    --eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --player died
        if( wave == 2) then -- spawn carrion drake randomly in the ring
           eq.spawn2("carrion drake",0,0,xloc1,yloc1,zloc1,2.0);  -- add NPCID edit size of the ring
        elseif(wave == 3) then -- spawn carrion drake randomly in the ring
            eq.spawn2("carrion drake",0,0,xloc1,yloc1,zloc1,2.0);  -- add NPCID edit size of the ring
        elseif(wave == 4) then -- spawn carrion drake randomly in the ring
            eq.spawn2("carrion drake",0,0,xloc1,yloc1,zloc1,2.0);  -- add NPCID edit size of the ring
        end
    end
end

function event_timer(e)
    if(e.timer == "wave1") then
        wave = wave + 1; -- wave = 2
        eq.stop_timer(e.timer)
        eq.set_timer("wave2", 600000); -- starts wave 3
        eq.spawn2("flurry drake",0,0,xloc1,yloc1,zloc1,hloc1);
        
        local wave2Spawns = 4;
    
        for i = 1, wave2Spawns do
            eq.spawn2("rampaging hatchlings",0,0,
                    xloc+math.random(-45,45),
                    yloc+math.random(-45,45),
                    zloc,
                    math.random(0, 250)
            );
        end
    elseif(e.timer == "wave2") then
        wave = wave + 1; -- wave = 3
        eq.stop_timer(e.timer)
        eq.set_timer("wave3", 600000); -- starts wave 4
        eq.spawn2("wurm",0,0,xloc4,yloc4,zloc4,hloc4);
        eq.spawn2("wurm",0,0,xloc4,yloc4,zloc4,hloc4);
        eq.spawn2("drake",0,0,xloc2,yloc2,zloc2,hloc2);
        eq.spawn2("drake",0,0,xloc3,yloc3,zloc3,hloc3);
        
        local wave3Spawns = math.random(3, 4);
    
        for i = 1, wave3Spawns do
            eq.spawn2("rampaging hatchlings",0,0,
                    xloc+math.random(-45,45),
                    yloc+math.random(-45,45),
                    zloc,
                    math.random(0, 250)
            );
        end        
    elseif(e.timer == "wave3") then
        wave = wave + 1; -- wave = 4
        eq.stop_timer(e.timer)
        eq.set_timer("wave4", 600000); -- starts wave 5
        eq.spawn2("Zruk the Lifestealer",0,0,xloc4,yloc4,zloc4,hloc4);
    elseif(e.timer == "wave4") then
        wave = wave + 1; -- wave = 5
        eq.stop_timer(e.timer)
        eq.set_timer("wave5", 600000); -- starts wave 6
		eq.spawn2("wurm",0,0,xloc4,yloc4,zloc4,hloc4);
        eq.spawn2("wurm",0,0,xloc4,yloc4,zloc4,hloc4);
		eq.spawn2("drake",0,0,xloc2,yloc2,zloc2,hloc2);
        eq.spawn2("drake",0,0,xloc3,yloc3,zloc3,hloc3);
		
		local wave5Spawns = 4;
    
        for i = 1, wave5Spawns do
            eq.spawn2("rampaging hatchlings",0,0,
                    xloc+math.random(-45,45),
                    yloc+math.random(-45,45),
                    zloc,
                    math.random(0, 250)
            );
        end
    elseif(e.timer == "wave5") then
        wave = wave + 1; -- wave = 6
        eq.stop_timer(e.timer)
        eq.set_timer("wave6", 600000); -- starts wave 7
		eq.spawn2("drake",0,0,xloc2,yloc2,zloc2,hloc2); -- splits like the horses in Sky
		eq.spawn2("drake",0,0,xloc3,yloc3,zloc4,hloc4); -- splits like the horses in Sky
		
    elseif(e.timer == "wave6") then
        wave = wave + 1; -- wave = 7
        eq.stop_timer(e.timer)
        eq.set_timer("wave7", 600000); -- starts wave 8
		eq.spawn2("templar flurry drake",0,0,xloc2,yloc2,zloc2,hloc2);
		eq.spawn2("templar flurry drake",0,0,xloc4,yloc4,zloc4,hloc4);
		eq.spawn2("templar flurry drake",0,0,xloc3,yloc3,zloc3,hloc3);
    elseif(e.timer == "wave7") then
        wave = wave + 1; -- wave = 8
        eq.stop_timer(e.timer)
        eq.set_timer("wave8", 600000); -- starts wave 9
		eq.spawn2("Rathek the Tigerclaw",0,0,xlocBoss,ylocBoss,zlocBoss,hlocBoss);
		eq.spawn2("RAMPAGING racnar",0,0,xlocBoss +5,ylocBoss +5,zlocBoss,hlocBoss);
    elseif(e.timer == "wave8") then
        wave = wave + 1; -- wave = 9
        eq.stop_timer(e.timer)
        eq.set_timer("wave9", 600000); -- starts wave 10
		eq.spawn2("destroyers",0,0,xloc2,yloc2,zloc2,hloc2);
		eq.spawn2("destroyers",0,0,xloc4,yloc4,zloc4,hloc4);
		eq.spawn2("destroyers",0,0,xloc3,yloc3,zloc3,hloc3);
		eq.spawn2("destroyers",0,0,xloc1,yloc1,zloc1,hloc1);
		eq.spawn2("destroyers",0,0,xlocBoss,ylocBoss,zlocBoss,hlocBoss);
    elseif(e.timer == "wave9") then
        wave = wave + 1; -- wave = 10
        eq.stop_timer(e.timer)
        eq.set_timer("wave10", 600000); -- starts wave 11
		eq.spawn2("templar flurry drake",0,0,xloc2,yloc2,zloc2,hloc2);
		eq.spawn2("templar flurry drake",0,0,xloc3,yloc3,zloc3,hloc3);
 
    elseif(e.timer == "wave10") then
        wave = wave + 1; -- wave = 11
        eq.stop_timer(e.timer)
        eq.set_timer("wave11", 600000); -- starts wave 12
		eq.spawn2("destroyers",0,0,xloc2,yloc2,zloc2,hloc2);
		eq.spawn2("destroyers",0,0,xloc3,yloc3,zloc3,hloc3);
		eq.spawn2("templar flurry drake",0,0,xloc1,yloc1,zloc1,hloc1);
    elseif(e.timer == "wave11") then
        wave = wave + 1; -- wave = 12
        eq.stop_timer(e.timer)
        eq.set_timer("wave12", 600000); -- starts wave 13
		eq.spawn2("Vethrol the Skycaller",0,0,xlocBoss,ylocBoss,zlocBoss,hlocBoss);
    elseif(e.timer == "wave12") then
        wave = wave + 1; -- wave = 13
        eq.stop_timer(e.timer)
        eq.set_timer("wave13", 600000); -- starts wave 14
		eq.spawn2("templar flurry drake",0,0,xloc2,yloc2,zloc2,hloc2);
		eq.spawn2("templar flurry drake",0,0,xloc3,yloc3,zloc3,hloc3);
		eq.spawn2("templar flurry drake",0,0,xloc1,yloc1,zloc1,hloc1);
    elseif(e.timer == "wave13") then
        wave = wave + 1; -- wave = 14
        eq.stop_timer(e.timer)
        eq.set_timer("wave14", 600000); -- starts wave 15
        eq.spawn2("warden",0,0,xloc2,yloc2,zloc2,hloc2); --splits into 3 total of 9 for wave 3 per
		eq.spawn2("warden",0,0,xloc3,yloc3,zloc3,hloc3); --splits into 3
		eq.spawn2("warden",0,0,xloc1,yloc1,zloc1,hloc1); --splits into 3
    elseif(e.timer == "wave14") then
        wave = wave + 1; -- wave = 15
        eq.stop_timer(e.timer)
        eq.set_timer("wave15", 600000); -- starts wave 16
		eq.spawn2("warden",0,0,xloc2,yloc2,zloc2,hloc2); --splits into 2, 5 times total of 22 for wave 11 per
		eq.spawn2("warden",0,0,xloc3,yloc3,zloc3,hloc3); --splits into 2, 5 times
    elseif(e.timer == "wave15") then
        wave = wave + 1; -- wave = 16
        eq.stop_timer(e.timer)
        eq.set_timer("wave16", 900000); -- starts wave 17
		eq.spawn2("The Herald of Vulak'Aerr",0,0,xlocBoss,ylocBoss,zlocBoss,hlocBoss);
    elseif(e.timer == "wave16") then
        wave = wave + 1; -- wave = 17
        eq.stop_timer(e.timer)
        eq.set_timer("depop", 900000); -- starts depop
		eq.spawn2("Vulak'Aerr",0,0,xlocBoss,ylocBoss,zlocBoss,hlocBoss);
    end
<<<<<<< HEAD
end
=======
end
>>>>>>> b629a81ac46839392cc1510147d1a5c717b68c76
