function event_spawn(e)
    eq.set_proxmity(e.self:GetX() - 7, e.self:GetX() + 7, e.self:GetY() - 7, e.self:GetY() + 7);
end

function event_enter(e)
    local cheater = eq.get_entity_list:GetMobByNpcTypeID(123011);

    if (cheater == true) then
        cheater:CastToNPC():AddToHateList(e.other, 1);
    end

end
