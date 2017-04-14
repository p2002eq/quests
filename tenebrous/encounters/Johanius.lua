-- Johanius Stake of Slaying quest in tenebrous

function event_encounter_load(e)
    eq.zone_emote(15, 'encounter loaded');
    -- spawn NPCs for rescue
    eq.spawn2(172192,0,0,-377,1268,-28,0); -- Aellana_Barleou
    eq.spawn2(172193,0,0,-366,1254,-28,0); -- Lyrra_Rutledge
        
	eq.register_npc_event("Johanius", Event.death_complete, 172004, CheckCamp);
    eq.register_npc_event("Johanius", Event.death_complete, 172020, CheckCamp);
    eq.register_npc_event("Johanius", Event.death_complete, 172041, CheckCamp);
    eq.register_npc_event("Johanius", Event.death_complete, 172044, CheckCamp);
end

function CampCheck(e)
    -- return true if NPC found in camp
    local npcs_of_interest = { 172004, 172020, 172041, 172044 };
    local entity_list = eq.get_entity_list();
    local npc_list = entity_list:GetNPCList();
    if (npc_list ~= nil) then
        for npc in npc_list.entries do
            local x, y = npc:GetSpawnPointX(), npc:GetSpawnPointY();
            -- if NPC alive AND on list of interest AND spawned in area of camp (prevents training away of NPCs), return true
            if npc.valid and npcs_of_interest[npc:GetNPCTypeID()] ~= nil and x > -470 and x < -260 and y > -400 and y < -340 then
                eq.zone_emote(15, 'mob found: ' .. npc:GetName());
                return true
            end
        end
    end
    
    eq.zone_emote(15, 'no mobs found!');
    -- if no mobs found, spawn new Johanius and unload
    eq.spawn2(172190,3,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #Sir_Johanius_Barleou
    eq.signal(172032, 1);
    eq.zone_emote(15, 'signals sent');
end
