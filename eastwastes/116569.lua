function event_spawn(e)
    e.self:Say("spawned");
    local corbin = eq.get_entity_list():GetMobByNpcTypeID(116119);
    if ( corbin ) then
        e.self:Say("hatelist");
        for mob in corbin.entries do
            e.self:AddToHateList(mob, 1);
            e.self:Say("added");
        end
    end
    e.self:Say("ended");
end