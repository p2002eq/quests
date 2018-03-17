function event_combat(e)
    e.self:emote("been ambushed!");
end

function event_spawn(event)
    local xloc = event.self:GetX();
    local yloc = event.self:GetY();
    local zloc = event.self:GetZ();
    eq.set_proximity(xloc - 45, xloc + 45, yloc - 45, yloc + 45, zloc - 45, zloc + 45);
end

function event_enter(event)
    local numSpawns = math.random(2, 3);
    
    for i = 1, numSpawns do
        eq.spawn2(  116540,
                    0,
                    0,
                    event.self:GetX()+math.random(-5,5),
                    event.self:GetY()+math.random(-5,5),
                    event.self:GetZ(),
                    math.random(0, 250)
        );
    end
    eq.depop_with_timer();
end