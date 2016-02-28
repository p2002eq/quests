function event_spawn(e)
    e.self:Say("spawned");
    e.self:Attack(eq.get_entity_list():GetMobID(116119));
    e.self:Say("ended");
end