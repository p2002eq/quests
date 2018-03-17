---- Rockhopper/Sambata Cycle
function event_death_complete(e)
    local qglobals = eq.get_qglobals();
    if(qglobals["Rockhopper_Sambata"] == nil) then
        eq.spawn_condition("dawnshroud",0,2,0);
        eq.spawn_condition("dawnshroud",0,1,1);
    end
end