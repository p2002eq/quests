function event_spawn(e)
    --eq.ModifyNPCStat('runspeed',3);
    e.self:ModifyNPCStat('runspeed',3);
end
function event_death_complete(e)
    eq.depop_all(116534);
end