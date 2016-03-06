function event_spawn(e)
    eq.modify_npc_stat('runspeed',3);
end
function event_death_complete(e)
    eq.depop_all(116534);
end