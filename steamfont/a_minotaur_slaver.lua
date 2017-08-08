--NPC: a_minotaur_slaver   Zone: steamfont

function event_death_complete(e)
    if(math.random(100) < 5) then
        eq.unique_spawn(56152,0,0,-1294,1360,-103);
        e.self:Say("I die soon! Meldrath, help me!");
    end
end
