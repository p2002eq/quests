function event_spawn(e)
    eq.settimer("depop", 300000);
end

function event_timer(e)
    eq.stoptimer("depop");
    eq.depop();
end

function event_death_complete(e)
    eq.unique_spawn(100222,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- Ghost_of_Ridossan
    e.self:Say("You may have slain me, but your conscience will slay you in the end, and it will be a hundreds times more painful.");
end