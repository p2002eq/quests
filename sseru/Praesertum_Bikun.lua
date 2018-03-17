-- Depop (No Repsawn) if in an instance

function event_spawn(e)
    local instance_id = eq.get_zone_instance_id();
    if(instance_id ~= 0) then
        eq.depop()
    end
  end
