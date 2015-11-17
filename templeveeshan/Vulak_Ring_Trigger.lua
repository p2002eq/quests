local wave = 0;
local xloc = event.self:GetX();
local yloc = event.self:GetY();
local zloc = event.self:GetZ();

local xloc1 = 0;
local yloc1 = 0;
local zloc1 = 0;
local hloc1 = 0;

local xloc2 = 0;
local yloc2 = 0;
local zloc2 = 0;
local hloc2 = 0;

local xloc3 = 0;
local yloc3 = 0;
local zloc3 = 0;
local hloc3 = 0;

local xloc4 = 0;
local yloc4 = 0;
local zloc4 = 0;
local hloc4 = 0;

local xlocBoss = 0;
local ylocBoss = 0;
local zlocBoss = 0;
local hlocBoss = 0;

function event_spawn(event)
    eq.set_proximity(xloc - 45, xloc + 45, yloc - 45, yloc + 45, zloc - 45, zloc + 45);
end

function event_enter(event)
    wave = wave + 1;
    eq.set_timer("wave1", 600000); -- starts wave 2
    eq.spawn2("wurm",0,0,xloc4,yloc4,zloc4,hloc4);
    eq.spawn2("drake",0,0,xloc2,yloc2,zloc2,hloc2);
    eq.spawn2("drake",0,0,xloc3,yloc3,zloc3,hloc3);
    
    local wave1Spawns = math.random(2, 3);
    
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
           --eq.spawn2("carrion drake",0,0,xloc + math.random(-45,45),yloc + math.random(-45,45), zloc + math.random(-45,45),e.self:GetHeading());  -- add NPCID edit size of the ring
        elseif(wave == 3) then -- spawn carrion drake randomly in the ring
            --eq.spawn2("carrion drake",0,0,xloc + math.random(-45,45),yloc + math.random(-45,45), zloc + math.random(-45,45),e.self:GetHeading());  -- add NPCID edit size of the ring
        elseif(wave == 4) then -- spawn carrion drake randomly in the ring
            --eq.spawn2("carrion drake",0,0,xloc + math.random(-45,45),yloc + math.random(-45,45), zloc + math.random(-45,45),e.self:GetHeading());  -- add NPCID edit size of the ring
        end
    end
end

function event_timer(e)
    if(e.timer == "wave1") then
        wave = wave + 1; -- wave = 2
        eq.stop_timer(e.timer)
        eq.set_timer("wave2", 600000); -- starts wave 3
        eq.spawn2("flurry drake",0,0,xloc1,yloc1,zloc1,hloc1);
        
        local wave2Spawns = math.random(3, 4);
    
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
        eq.spawn2("Zruk the Lifestealer",0,0,xlocBoss,ylocBoss,zlocBoss,hlocBoss);
    elseif(e.timer == "wave4") then
        wave = wave + 1; -- wave = 5
        eq.stop_timer(e.timer)
        eq.set_timer("wave5", 600000); -- starts wave 6
    elseif(e.timer == "wave5") then
        wave = wave + 1; -- wave = 6
        eq.stop_timer(e.timer)
        eq.set_timer("wave6", 600000); -- starts wave 7
    elseif(e.timer == "wave6") then
        wave = wave + 1; -- wave = 7
        eq.stop_timer(e.timer)
        eq.set_timer("wave7", 600000); -- starts wave 8
    elseif(e.timer == "wave7") then
        wave = wave + 1; -- wave = 8
        eq.stop_timer(e.timer)
        eq.set_timer("wave8", 600000); -- starts wave 9
    elseif(e.timer == "wave8") then
        wave = wave + 1; -- wave = 9
        eq.stop_timer(e.timer)
        eq.set_timer("wave9", 600000); -- starts wave 10
    elseif(e.timer == "wave9") then
        wave = wave + 1; -- wave = 10
        eq.stop_timer(e.timer)
        eq.set_timer("wave10", 600000); -- starts wave 11 
    elseif(e.timer == "wave10") then
        wave = wave + 1; -- wave = 11
        eq.stop_timer(e.timer)
        eq.set_timer("wave11", 600000); -- starts wave 12        
    elseif(e.timer == "wave11") then
        wave = wave + 1; -- wave = 12
        eq.stop_timer(e.timer)
        eq.set_timer("wave12", 600000); -- starts wave 13
    elseif(e.timer == "wave12") then
        wave = wave + 1; -- wave = 13
        eq.stop_timer(e.timer)
        eq.set_timer("wave13", 600000); -- starts wave 14
    elseif(e.timer == "wave13") then
        wave = wave + 1; -- wave = 14
        eq.stop_timer(e.timer)
        eq.set_timer("wave14", 600000); -- starts wave 15        
    elseif(e.timer == "wave14") then
        wave = wave + 1; -- wave = 15
        eq.stop_timer(e.timer)
        eq.set_timer("wave15", 600000); -- starts wave 16
    elseif(e.timer == "wave15") then
        wave = wave + 1; -- wave = 16
        eq.stop_timer(e.timer)
        eq.set_timer("wave16", 900000); -- starts wave 17  
    elseif(e.timer == "wave16") then
        wave = wave + 1; -- wave = 17
        eq.stop_timer(e.timer)
        eq.set_timer("depop", 900000); -- starts depop       
    end
end