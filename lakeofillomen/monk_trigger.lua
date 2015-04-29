function event_signal(e)
    eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --Deep died 
        Deep = 1;
    end
    if(e.signal == 2) then --Vorash died 
        Vorash = 1;
    end
    if(Deep = 1) and (Vorash = 1) then
         eq.unique_spawn(85396,0,0,-541,-806,80); 
         eq.depop();
    end
end