function event_spawn(e)
    e.self:Say("spawned");
    local corbin = eq.get_entity_list():GetMobByNpcTypeID(15178);
    if ( corbin ) then
        e.self:Say("hatelist");
        for mob in corbin.entries do
                e.self:Say("mob");
            e.self.AddToHateList(mob);
                e.self:Say("added");
        end
    end
    e.self:Say("ended");
end