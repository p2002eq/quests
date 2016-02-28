function event_spawn(e)
    e.self:Say("spawned");
    eq.get_entity_list():GetMobID(116119):CastToNPC();
    e.self:Say("ended");
end