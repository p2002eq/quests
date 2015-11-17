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
    end
end