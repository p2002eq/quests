function event_spawn(e)
    eq.set_timer("Shout",600000);
end

function event_timer(e)
    if(e.timer == "Shout") then
        anoy_the_zone(e)
    end
end

function anoy_the_zone(e)
    if(math.random(100) < 50) then
        e.self:Shout('ALL PRAISE INNORUUK, OUR LORD AND CREATOR!');
    else
        e.self:Shout('Did you honestly believe your pathetic efforts could extinguish the unstoppable might of HATE? I loathe you and your naivete with every fiber of my being. Know that our Lord and Master will survive as long as we children fuel his existence.');
    end
end

function event_death_complete(e)
    e.stop_timer("Shout");
end
