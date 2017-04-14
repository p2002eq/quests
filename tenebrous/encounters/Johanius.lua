-- Johanius Stake of Slaying quest in tenebrous

function event_encounter_load(e)
    -- spawn NPCs for rescue
    eq.spawn2(172192,0,0,-377,1268,-28,0); -- Aellana_Barleou
    eq.spawn2(172193,0,0,-366,1254,-28,0); -- Lyrra_Rutledge
        
	eq.register_npc_event('Johanius', Event.death_complete, 172004, CheckCamp);
    eq.register_npc_event('Johanius', Event.death_complete, 172020, CheckCamp);
    eq.register_npc_event('Johanius', Event.death_complete, 172041, CheckCamp);
    eq.register_npc_event('Johanius', Event.death_complete, 172044, CheckCamp);
end

function CheckCamp(e)
    -- return true if NPC found in camp
    local npcs_of_interest = Set({ 172004, 172020, 172041, 172044 });
    local entity_list = eq.get_entity_list();
    local npc_list = entity_list:GetNPCList();
    if (npc_list ~= nil) then
        for npc in npc_list.entries do
            local x, y = npc:GetSpawnPointX(), npc:GetSpawnPointY();
            -- if NPC alive AND on list of interest AND spawned in area of camp (prevents training away of NPCs), return true
            if npc.valid and npcs_of_interest[npc:GetNPCTypeID()] ~= nil and x > -470 and x < -260 and y < 1500 and y > 1200 then
                return true
            end
        end
    end
    
    -- if no mobs found, alert Johanius
    eq.signal(172032, 1);
end

-- helper function
function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end
