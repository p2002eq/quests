-- mobs in Gunthak that potentially spawn Erudite Spirits for Cleric and Paladin quests

function event_death_complete(e)
    local result = math.random(100);
    local cleric = false;
    local paladin = false;
    local spirit_spawn_threshold = 20;

    if results > spirit_spawn_threshold then return end -- if we can't spawn anything, don't bother with the rest of the logic!

    if e.other:CastToClient():IsGrouped() then -- if client is grouped, loop through client's group and look for people who need the spirits
        local other_group = e.other:CastToClient():GetGroup();
        for i = 1, other_group:GroupCount(), 1 do
            local player = other_group:GetMember(i);
            if not cleric then -- if we already found a cleric that needs, don't check for clerics
                cleric = player:GetGlobal("Millius_Cleric") == "1" and player or false
            if not paladin then -- if we already found a paladin that needs, don't check for paladins
                paladin = player:GetGlobal("Millius_Paladin") == "1" and player or false
            if cleric and paladin then -- if we already found both, stop looking!
                break
            end
        end

    else -- if not grouped, just grab globals directly
        cleric = e.other:GetGlobal("Millius_Cleric") == "1" and e.other or false
        paladin = e.other:GetGlobal("Millius_Paladin") == "1" and e.other or false
    end

    -- see if anyone gets lucky!
    if(result <= (spirit_spawn_threshold / 2) and cleric) then
        local spawn = eq.get_entity_list():GetSpawnByID(1046892);
        local spirit = eq.unique_spawn(224338, 0, 0, spawn:GetX(), spawn:GetY(), spawn:GetZ(), spawn:GetHeading());
        if spirit then
            spawn:Depop();
            spawn:SetNPCPointer(spirit:CastToNPC());
            cleric:SetGlobal("Millius_Cleric", "2", 1, "F")
        end
        
    elseif(result > (spirit_spawn_threshold / 2) and result <= spirit_spawn_threshold and paladin) then
        local spawn = eq.get_entity_list():GetSpawnByID(1047209);
        local spirit = eq.unique_spawn(224008, 0, 0, spawn:GetX(), spawn:GetY(), spawn:GetZ(), spawn:GetHeading());
        if spirit then
            spawn:Depop();
            spawn:SetNPCPointer(spirit:CastToNPC());
            paladin:SetGlobal("Millius_Paladin", "2", 1, "F")
        end
    end
end
