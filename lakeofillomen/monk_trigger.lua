function event_signal(e)
   local spawn = 0;

    --eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --Deep died 
        spawn = spawn + 1;
        if(spawn == 2) then
            spawn = spawn - 2;
            eq.unique_spawn(85396,0,0,-541,-806,80);
            end
    end
    
end