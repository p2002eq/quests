-- mobs in Gunthak that potentially spawn Erudite Spirits for Cleric and Paladin quests

-- set spawn and NPC types for quest spirits
cleric_spawn, cleric_mob = 1046892, 224338;
paladin_spawn, paladin_mob = 1047209, 224008;

function event_death_complete(e)
    local result = math.random(100);
    local cleric = false;
    local paladin = false;
    local spirit_spawn_threshold = 20;

    if result > spirit_spawn_threshold then return end -- if we can't spawn anything, don't bother with the rest of the logic!

    if e.other:CastToClient():IsGrouped() then -- if client is grouped, loop through client's group and look for people who need the spirits
        local other_group = e.other:CastToClient():GetGroup();
        for i = 0, other_group:GroupCount()-1 do
            local player = other_group:GetMember(i);
            -- check for clerics and paladins. stop looking for each one once you find it (so they don't get overwritten by other group members)
            if not cleric then cleric = player:GetGlobal("Millius_Cleric") and player or false end
            if not paladin then paladin = player:GetGlobal("Millius_Paladin") and player or false end
            if cleric and paladin then break end
        end

    else -- if not grouped, just grab globals directly
        cleric = e.other:GetGlobal("Millius_Cleric") and e.other or false;
        paladin = e.other:GetGlobal("Millius_Paladin") and e.other or false;
    end

    -- see if anyone gets lucky!
    if cleric and (result <= (spirit_spawn_threshold / 2)) then
        local spawn_check = spawn_and_assign(cleric_spawn, cleric_mob)
        if spawn_check then cleric:SetGlobal("Millius_Cleric", "2", 1, "F") end

    elseif paladin and (result > (spirit_spawn_threshold / 2) and result <= spirit_spawn_threshold) then
        local spawn_check = spawn_and_assign(paladin_spawn, paladin_mob)
        if spawn_check then paladin:SetGlobal("Millius_Paladin", "2", 1, "F") end
    end
end

function spawn_and_assign(spawn_id, npc_id)
    local spawn = eq.get_entity_list():GetSpawnByID(spawn_id);
    local spirit = eq.unique_spawn(npc_id, 0, 0, spawn:GetX(), spawn:GetY(), spawn:GetZ(), spawn:GetHeading());

    if spirit then
        -- depop current... in the most painful way possible!
        for npc in eq.get_entity_list():GetNPCList().entries do
            if npc:GetSpawnPointID() == spawn_id then npc:Depop() end
        end
        
        spawn:SetNPCPointer(spirit:CastToNPC());
        return spirit
    end

    return false
end
