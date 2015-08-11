function event_spawn(e)
    eq.set_timer("Shout", 300000);
    anoy_the_zone(e);
end

function anoy_the_zone(e)
    if(math.random(100) < 50) then
        e.self:Shout('ALL PRAISE INNORUUK, OUR LORD AND CREATOR!');
        eq.signal(76383, 1);
        eq.signal(76215, 1);
        eq.signal(76021, 1);
        eq.signal(76346, 1);
        eq.signal(76087, 1);
    else
        e.self:Shout('Did you honestly believe your pathetic efforts could extinguish the unstoppable might of HATE? I loathe you and your naivete with every fiber of my being. Know that our Lord and Master will survive as long as we the children fuel his existence.');
    end
end

function event_death_complete(e)
    eq.stop_timer("Shout");
end

function event_timer(e)
    if(e.timer == "Shout") then
        anoy_the_zone(e);
    end
end
